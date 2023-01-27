Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308BC3205
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 22:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2547CC433D2;
	Fri, 27 Jan 2023 22:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674860148;
	bh=M/MSSFJTt2JantLs11iRl/ZAuogcLvKlYYz+7Vg1Q2g=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=m32Po3ZDKUBE3u+yFBiUgMIGQE9klgwhuuJqiAQw7bcaZ1EZlunUEmh4dgD/eI5j6
	 o+QfFAkFZj+HNxqPFGIJhFqTpieun8/AtWqnH+fSBY5HyYIsSEDICG78Q7hV2cIaRv
	 y4gpqbWmNC5EwXbcIUnf6FIqyfOTRkhORxLpOKnKiGJpOepsmsFXoF0c33xvKBwz4r
	 aSOWeWpTer5v1LCU3sOmMnCGM9vv3ix5egAXD1/NKFcoPYZeSQHHql830PWQvO7zlC
	 QBaXYZkMwrg8bi2VXbG6zzV7CXoCxYGJ/BLDH/DXwZsiMFLdwFYzewxKzu9tpU78Ax
	 xf+xoge7jTI2A==
Date: Fri, 27 Jan 2023 23:55:44 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner drivers fixes for 6.2
Message-ID: <Y9RWcDdO0nj98KVj@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.2-1

for you to fetch changes up to f71eaf2708be7831428eacae7db25d8ec6b8b4c5:

  bus: sunxi-rsb: Fix error handling in sunxi_rsb_init() (2023-01-08 21:35:01 +0100)

----------------------------------------------------------------
- Fix error handling in RSB init

----------------------------------------------------------------
Yuan Can (1):
      bus: sunxi-rsb: Fix error handling in sunxi_rsb_init()

 drivers/bus/sunxi-rsb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
