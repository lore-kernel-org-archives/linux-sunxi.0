Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBED226CF0
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972134; cv=none; b=dzfbAQx9leYGO1fq7OJhi8E3NPE6Yb+B3ClzGeQbe9Xe97dpMkjQPXy4E5cKgmiemJHhHhwGbwfMwXzgTeztNoEw/8qnuzRBL1exRG3hG9Nc7wOHK1N61sUF0p4M0UkKx51Dzxn/Z7UtUmRiBZOrsDqK8ebSF1bULLcmS4f2B9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972134; c=relaxed/simple;
	bh=D3xSBBXS02HL9nFCouhbwvSZ519y0dFEkxLudgP50E4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXOP+LyOXzynrnpIg9apz57okLMyq0Vlaz8bh0do258MGra+WW7d11YND8n3+OlysIviZZOfZT7LlzHXzg70aVaHuKnv1kodq7DFsyfAqQSd1JIhnMclcbqFb9bWxeYq08ee5o7jHv2kmm/EN9tknDLgasR8aKUuBZPRNUx8KPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plIj/WmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plIj/WmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3B3C4CEF9;
	Mon, 20 Oct 2025 14:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760972134;
	bh=D3xSBBXS02HL9nFCouhbwvSZ519y0dFEkxLudgP50E4=;
	h=From:To:Cc:Subject:Date:From;
	b=plIj/WmJNW87jAJIvltWLTPMOi9+1c/hO9T6to240V+jtR9WvlNPbN4Pp029or0AD
	 YmOx1FNgFSFj2GFz24+woNofnmzZOhF6Hm9mUDaYlX7zjm50PLDL4lAm6WDFfZrekD
	 75FXaPnFbUdO6LPBPu9T/D6Udx6D14jjXAbhDPeEpQcqUiO9TWgBw31q9y6IhF9UpQ
	 JYHWSEwVL/9iQVzwlz+mb+KZNJcv2rqjHlOh181JoJmB1HFKqCDKvHdk2gHyI9a4B7
	 6SR4LVKBxnGchMUY3UKrutqbm0LUcv1ajALZeEEZZUQye83XulounP/NOrnOr4AcFw
	 9JztpBOrHQDZA==
Received: by wens.tw (Postfix, from userid 1000)
	id 888875FDC3; Mon, 20 Oct 2025 22:55:31 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: u-boot@lists.denx.de
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] .mailmap: update email address for Chen-Yu Tsai
Date: Mon, 20 Oct 2025 22:55:27 +0800
Message-ID: <20251020145527.2702250-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The email forwarder I'm using has run into severe problems with Gmail
lately. Switch over to my kernel.org address.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index f1b93d168e90..e08dfd3a5263 100644
--- a/.mailmap
+++ b/.mailmap
@@ -36,6 +36,7 @@ Bin Meng <bmeng.cn@gmail.com> <bin.meng@windriver.com>
 Boris Brezillon <bbrezillon@kernel.org> <boris.brezillon@bootlin.com>
 Boris Brezillon <bbrezillon@kernel.org> <boris.brezillon@free-electrons.com>
 Casey Connolly <casey.connolly@linaro.org> <caleb.connolly@linaro.org>
+Chen-Yu Tsai <wens@kernel.org> <wens@csie.org>
 Christian Kohn <chris.kohn@amd.com> <christian.kohn@xilinx.com>
 Christopher Obbard <christopher.obbard@linaro.org> <chris.obbard@collabora.com>
 Dirk Behme <dirk.behme@googlemail.com>
-- 
2.47.3

