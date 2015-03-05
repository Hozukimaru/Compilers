// Generated from Lab.g4 by ANTLR 4.4
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link LabParser}.
 */
public interface LabListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by the {@code andExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAndExpr(@NotNull LabParser.AndExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code andExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAndExpr(@NotNull LabParser.AndExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#stat_block}.
	 * @param ctx the parse tree
	 */
	void enterStat_block(@NotNull LabParser.Stat_blockContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#stat_block}.
	 * @param ctx the parse tree
	 */
	void exitStat_block(@NotNull LabParser.Stat_blockContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(@NotNull LabParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(@NotNull LabParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stringAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterStringAtom(@NotNull LabParser.StringAtomContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stringAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitStringAtom(@NotNull LabParser.StringAtomContext ctx);
	/**
	 * Enter a parse tree produced by the {@code numberAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterNumberAtom(@NotNull LabParser.NumberAtomContext ctx);
	/**
	 * Exit a parse tree produced by the {@code numberAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitNumberAtom(@NotNull LabParser.NumberAtomContext ctx);
	/**
	 * Enter a parse tree produced by the {@code parExpr}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterParExpr(@NotNull LabParser.ParExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code parExpr}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitParExpr(@NotNull LabParser.ParExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nilAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterNilAtom(@NotNull LabParser.NilAtomContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nilAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitNilAtom(@NotNull LabParser.NilAtomContext ctx);
	/**
	 * Enter a parse tree produced by the {@code idAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterIdAtom(@NotNull LabParser.IdAtomContext ctx);
	/**
	 * Exit a parse tree produced by the {@code idAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitIdAtom(@NotNull LabParser.IdAtomContext ctx);
	/**
	 * Enter a parse tree produced by the {@code unaryMinusExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterUnaryMinusExpr(@NotNull LabParser.UnaryMinusExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code unaryMinusExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitUnaryMinusExpr(@NotNull LabParser.UnaryMinusExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#parse}.
	 * @param ctx the parse tree
	 */
	void enterParse(@NotNull LabParser.ParseContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#parse}.
	 * @param ctx the parse tree
	 */
	void exitParse(@NotNull LabParser.ParseContext ctx);
	/**
	 * Enter a parse tree produced by the {@code equalityExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterEqualityExpr(@NotNull LabParser.EqualityExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code equalityExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitEqualityExpr(@NotNull LabParser.EqualityExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code notExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterNotExpr(@NotNull LabParser.NotExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code notExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitNotExpr(@NotNull LabParser.NotExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code atomExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAtomExpr(@NotNull LabParser.AtomExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code atomExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAtomExpr(@NotNull LabParser.AtomExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code additiveExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAdditiveExpr(@NotNull LabParser.AdditiveExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code additiveExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAdditiveExpr(@NotNull LabParser.AdditiveExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#log}.
	 * @param ctx the parse tree
	 */
	void enterLog(@NotNull LabParser.LogContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#log}.
	 * @param ctx the parse tree
	 */
	void exitLog(@NotNull LabParser.LogContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterStat(@NotNull LabParser.StatContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitStat(@NotNull LabParser.StatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code multiplicationExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterMultiplicationExpr(@NotNull LabParser.MultiplicationExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code multiplicationExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitMultiplicationExpr(@NotNull LabParser.MultiplicationExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code booleanAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterBooleanAtom(@NotNull LabParser.BooleanAtomContext ctx);
	/**
	 * Exit a parse tree produced by the {@code booleanAtom}
	 * labeled alternative in {@link LabParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitBooleanAtom(@NotNull LabParser.BooleanAtomContext ctx);
	/**
	 * Enter a parse tree produced by the {@code orExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterOrExpr(@NotNull LabParser.OrExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code orExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitOrExpr(@NotNull LabParser.OrExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code powExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterPowExpr(@NotNull LabParser.PowExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code powExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitPowExpr(@NotNull LabParser.PowExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(@NotNull LabParser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(@NotNull LabParser.AssignmentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code relationalExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterRelationalExpr(@NotNull LabParser.RelationalExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code relationalExpr}
	 * labeled alternative in {@link LabParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitRelationalExpr(@NotNull LabParser.RelationalExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#condition_block}.
	 * @param ctx the parse tree
	 */
	void enterCondition_block(@NotNull LabParser.Condition_blockContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#condition_block}.
	 * @param ctx the parse tree
	 */
	void exitCondition_block(@NotNull LabParser.Condition_blockContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#while_stat}.
	 * @param ctx the parse tree
	 */
	void enterWhile_stat(@NotNull LabParser.While_statContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#while_stat}.
	 * @param ctx the parse tree
	 */
	void exitWhile_stat(@NotNull LabParser.While_statContext ctx);
	/**
	 * Enter a parse tree produced by {@link LabParser#if_stat}.
	 * @param ctx the parse tree
	 */
	void enterIf_stat(@NotNull LabParser.If_statContext ctx);
	/**
	 * Exit a parse tree produced by {@link LabParser#if_stat}.
	 * @param ctx the parse tree
	 */
	void exitIf_stat(@NotNull LabParser.If_statContext ctx);
}