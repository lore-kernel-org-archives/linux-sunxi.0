Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DD0408E0
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 21:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F043C433EF;
	Fri,  9 Jun 2023 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686344770;
	bh=23X8I5L5LsqUbKZd+Ceg+SafHsI+Vl84xDTIjY5kSR0=;
	h=Date:From:To:Cc:Subject:From;
	b=OjED6qX97k3chdHJBfxlinpepEz3ndt45yviGg3eULTxXTMWSCiX39IlzwyX6f6Xg
	 5g6gbDDGQyMQbRsY/AvaS1qkgrL7dSIfO9rvTtW+HZjOfjQGLs2jwb7Rk9B0qM4hv+
	 OauoKtUvqiYWvslMXCL/mdqvhLGf8GE4K833Z8NSu7KupcpezMd8rLZsal1lWmLJuX
	 YbDROFp7YsCfrJ4KI5J/fGXb9kQG6HRg0y7bndGKyCtG0e0ZoMQWq3OPA/LesFz3vn
	 c4U/KsyUA775ofXzzKPbcf8Qsckzij7jZewoI2Jm3c9nrUqkARIw+7r5oYqz3gBZax
	 PIHrfxUY2w5rg==
Date: Fri, 9 Jun 2023 23:06:05 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.5
Message-ID: <20230609210605.GA17740@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock changes for 6.5.

Best regards,
Jernej

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.5-1

for you to fetch changes up to ca1170b69968233b34d26432245eddf7d265186b:

  clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux (2023-05-18 23:07:09 +0200)

----------------------------------------------------------------
- Preselect PLL MIPI as TCON0 parent for A64 SoC

----------------------------------------------------------------
Roman Beranek (1):
      clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)
