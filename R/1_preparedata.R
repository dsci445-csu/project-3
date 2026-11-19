library(tidyverse)
library(dplyr)

#loading necessary csv files
teams      <- read_csv("kaggle_data/MTeams.csv") %>% select(TeamID, TeamName)
reg_detail <- read_csv("kaggle_data/MRegularSeasonDetailedResults.csv")
seeds      <- read_csv("kaggle_data/MNCAATourneySeeds.csv") %>%
  filter(Season >= 2003) %>%
  mutate(seed_num = as.numeric(str_extract(Seed, "\\d+"))) %>%
  select(Season, TeamID, seed_num)

tourney    <- read_csv("kaggle_data/MNCAATourneyCompactResults.csv") %>%
  filter(Season >= 2003)
# unpivoting games into 1 row per team-game, which allows us to see how the 
#offense and defense did 

team_games <- bind_rows(
  reg_detail %>% transmute(
    Season, TeamID = WTeamID,
    # Offense (team's own stats)
    off_pts = WScore, off_fgm = WFGM, off_fga = WFGA,
    off_fgm3 = WFGM3, off_fga3 = WFGA3, off_ftm = WFTM, off_fta = WFTA,
    off_orb = WOR, off_ast = WAst, off_to = WTO,
    # Defense (opponent's stats + defensive plays)
    def_pts = LScore, def_fgm = LFGM, def_fga = LFGA,
    def_fgm3 = LFGM3, def_fga3 = WFGA3, def_drb = WDR,
    def_stl = WStl, def_blk = WBlk, def_fto = LTO, def_pf = WPF
  ),
  reg_detail %>% transmute(
    Season, TeamID = LTeamID,
    # Offense
    off_pts = LScore, off_fgm = LFGM, off_fga = LFGA,
    off_fgm3 = LFGM3, off_fga3 = LFGA3, off_ftm = LFTM, off_fta = LFTA,
    off_orb = LOR, off_ast = LAst, off_to = LTO,
    # Defense
    def_pts = WScore, def_fgm = WFGM, def_fga = WFGA,
    def_fgm3 = WFGM3, def_fga3 = WFGA3, def_drb = LDR,
    def_stl = LStl, def_blk = LBlk, def_fto = WTO, def_pf = LPF
  )
)
#1st dataframe for team profiles, good for EDA 
team_profiles <- team_games %>%
  group_by(Season, TeamID) %>%
  summarise(
    games       = n(),
    # Offensive metrics
    off_ppg     = mean(off_pts),
    off_fg_pct  = sum(off_fgm) / sum(off_fga),
    off_3p_pct  = sum(off_fgm3) / sum(off_fga3),
    off_ft_pct  = sum(off_ftm) / sum(off_fta),
    off_orb_pg  = mean(off_orb),
    off_ast_pg  = mean(off_ast),
    off_to_pg   = mean(off_to),
    # Defensive metrics
    def_ppg     = mean(def_pts),
    def_fg_pct  = sum(def_fgm) / sum(def_fga),
    def_3p_pct  = sum(def_fgm3) / sum(def_fga3),
    def_drb_pg  = mean(def_drb),
    def_stl_pg  = mean(def_stl),
    def_blk_pg  = mean(def_blk),
    def_fto_pg  = mean(def_fto),
    def_pf_pg   = mean(def_pf),
    .groups = "drop"
  ) %>%
  left_join(teams, by = "TeamID") %>%
  left_join(seeds, by = c("Season", "TeamID"))

#2nd dataframe for tourney matchups
matchups <- tourney %>%
  transmute(
    Season,
    Team1 = pmin(WTeamID, LTeamID),
    Team2 = pmax(WTeamID, LTeamID),
    y     = as.integer(WTeamID < LTeamID) # 1 if Team1 won, 0 if Team2 won
  ) %>%
  left_join(team_profiles, by = c("Season", "Team1" = "TeamID")) %>%
  left_join(team_profiles, by = c("Season", "Team2" = "TeamID"), suffix = c("_1", "_2")) %>%
  # doing team differentials 
  mutate(
    diff_seed       = seed_num_1 - seed_num_2,
    # Offensive 
    diff_off_ppg    = off_ppg_1 - off_ppg_2,
    diff_off_fg_pct = off_fg_pct_1 - off_fg_pct_2,
    diff_off_3p_pct = off_3p_pct_1 - off_3p_pct_2,
    diff_off_ft_pct = off_ft_pct_1 - off_ft_pct_2,
    diff_off_orb    = off_orb_pg_1 - off_orb_pg_2,
    diff_off_ast    = off_ast_pg_1 - off_ast_pg_2,
    diff_off_to     = off_to_pg_1 - off_to_pg_2,
    # Defensive 
    diff_def_ppg    = def_ppg_1 - def_ppg_2,
    diff_def_fg_pct = def_fg_pct_1 - def_fg_pct_2,
    diff_def_3p_pct = def_3p_pct_1 - def_3p_pct_2,
    diff_def_drb    = def_drb_pg_1 - def_drb_pg_2,
    diff_def_stl    = def_stl_pg_1 - def_stl_pg_2,
    diff_def_blk    = def_blk_pg_1 - def_blk_pg_2,
    diff_def_fto    = def_fto_pg_1 - def_fto_pg_2,
    diff_def_pf     = def_pf_pg_1 - def_pf_pg_2
  )

#Checking
glimpse(matchups)
table(matchups$y) #should be ~ 50/50
saveRDS(matchups, "cleaned_data/matchups.rds")
