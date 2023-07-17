package com.yojulab.study_springboot.utills;

public class Paginations {
	private int pageScale = 10; // 페이지당 게시물 수
	private int blockScale = 5; // 블록당 페이지수
	private int currentPage; // 현재 페이지 번호
	private int previousPage; // 이전 페이지
	private int nextPage; // 다음 페이지
	private int totalPage; // 전체 페이지 갯수
	private int currentBlock; // 현재 페이지 블록 번호
	private int totalBlock; // 전체 페이지 블록 갯수
	private int pageBegin; // 페이지 내에서의 레코드 시작 번호
	private int pageEnd; // 페이지 내에서의 레코드 마지막 번호
	private int blockStart; // 페이지 블록 내에서의 시작 페이지 번호
	private int blockEnd; // 페이지 블록 내에서의 마지막 페이지 번호
	private int totalCount; // 페이지 블록 내에서의 마지막 페이지 번호

    public Paginations(int totalCount, int currentPage){
        this.totalCount = totalCount;
        this.currentPage = currentPage;
        this.setTotalPage(totalCount);
        this.setPageRange();
        this.setTotalBlock();
        this.setBlockRange();
    }

    	// 전체 페이지 블록 갯수 계산
	public void setTotalBlock() {
		totalBlock = (int) Math.ceil(totalPage / blockScale);
	}
	// 현재 페이지가 몇번째 페이지에 속하는지 계산
	public void setBlockRange() {
		// 현재 페이지가 몇번째 페이지 블록에 속하는지 계산
		currentBlock = (int) Math.ceil((currentPage - 1) / blockScale) + 1;
		blockStart = (currentBlock - 1) * blockScale + 1; // 시작번호
		blockEnd = blockStart + blockScale - 1; // 끝번호
		if (blockEnd > totalPage) { // 마지막 페이지가 범위를 초과할 경우
			blockEnd = totalPage;
		}

		// 현재 블록이 1이면 이전 페이지를 1로 설정
		previousPage = currentBlock == 1 ? 1 : (currentBlock - 1) * blockScale;

		// 현재 블록이 마지막 블록이면 다음 페이지를 마지막 페이지 번호로 설정
		nextPage = currentBlock > totalBlock ? (currentBlock * blockScale) : (currentBlock * blockScale) + 1;

		// 마지막 페이지가 범위를 넘지 않도록 처리
		if (nextPage >= totalPage) {
			nextPage = totalPage;
		}
	}
    public void setPageRange(){
        // pageBegin = (this.currentPage - 1) * this.pageScale + 1;
        pageBegin = (this.currentPage - 1) * this.pageScale;
        pageEnd = this.pageBegin + pageScale - 1;
    }
    public void setTotalPage(int totalCount){
        this.totalPage = (int) Math.ceil(totalCount * 1.0 / this.pageScale);
    }

    public int getPageScale() {
        return pageScale;
    }

    public void setPageScale(int pageScale) {
        this.pageScale = pageScale;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageBegin() {
        return pageBegin;
    }

    public void setPageBegin(int pageBegin) {
        this.pageBegin = pageBegin;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }

    public int getBlockScale() {
        return blockScale;
    }

    public void setBlockScale(int blockScale) {
        this.blockScale = blockScale;
    }

    public int getPreviousPage() {
        return previousPage;
    }

    public void setPreviousPage(int previousPage) {
        this.previousPage = previousPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getCurrentBlock() {
        return currentBlock;
    }

    public void setCurrentBlock(int currentBlock) {
        this.currentBlock = currentBlock;
    }

    public int getTotalBlock() {
        return totalBlock;
    }

    public void setTotalBlock(int totalBlock) {
        this.totalBlock = totalBlock;
    }

    public int getBlockStart() { // loofing 시작
        return blockStart;
    }

    public void setBlockStart(int blockStart) {
        this.blockStart = blockStart;
    }

    public int getBlockEnd() { // loofing 끝
        return blockEnd;
    }

    public void setBlockEnd(int blockEnd) {
        this.blockEnd = blockEnd;
    }

    
}