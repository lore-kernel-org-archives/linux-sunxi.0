Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B46185D
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 12:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0F8C433D2;
	Sat,  8 Apr 2023 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680958380;
	bh=dwHi7p1RqpC698nInG1vgzLuDvLQ/jZaJR7pGmloPG4=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=YJnFaPx7d/CJutSzpZPkiYI47rvOH8++BFDTeONFnaHmPH/CjsqBzXzRnxkzACm9s
	 fUo4R61b40ZHLCgSYvf45Q4agfX2CbN9k530UDU0zKYvsaYLxckvqWu/6etjFe7hjh
	 AjbI41fF7VIXk7BzRit2b4Z6VQqaaEvPZGQ0TL85Vv0gb008heHuzaEDdjezUKY/gX
	 wfF5z4JqOVzjHON1YuTeLLBiYILyktFKKIvX2vxjhVLU1sxtCE5DfczF8r2XhSv8Kb
	 kmFF61tM6sxb/NEr6q8RfvSifKBdV9YMSdR8jD0kNRc51LRzPnuJiI7x+pUk3QhDw1
	 BTlQ6zCXaK+lg==
Date: Sat, 8 Apr 2023 14:52:55 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner drivers changes for 6.4
Message-ID: <20230408125255.GA17134@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following driver changes for 6.4.

Best regards,
Jernej

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.4-1

for you to fetch changes up to c014377bd053fad2f42b39626939560df1d5fc7d:

  kbuild, soc: sunxi: sram: remove MODULE_LICENSE in non-modules (2023-03-14 21:39:11 +0100)

----------------------------------------------------------------
- remove MODULE_LICENSE from sram driver
- use of_property_present() in mbus driver

----------------------------------------------------------------
Nick Alcock (1):
      kbuild, soc: sunxi: sram: remove MODULE_LICENSE in non-modules

Rob Herring (1):
      soc: sunxi: Use of_property_present() for testing DT property presence

 drivers/soc/sunxi/sunxi_mbus.c | 2 +-
 drivers/soc/sunxi/sunxi_sram.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)
