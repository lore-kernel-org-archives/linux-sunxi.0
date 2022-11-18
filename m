Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F518F
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Nov 2022 20:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F96C433D6;
	Fri, 18 Nov 2022 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668803593;
	bh=4wpG25blYuf/1i+hcui3E9cRtljegpIzpQDHpKaW4vc=;
	h=Date:From:To:Cc:Subject:From;
	b=DTIdu2T/CgFMe0rDR4QTyKxoEwoNr9lmHiIWohdrzCCuSreJPqDQwnCXf5Qz26HXp
	 W/Vb0ZtuBVtep3TYaCcZARweR29cZj0Egr4zPdIwkb1t8TyXAmFxx5rjiCp1QsRH6o
	 XumESiJ6GlA0LkwWBx9KkQhv9PMt7hD8SYj/fXpERw35H8ro8D4JI4GqFNuXq8MYYZ
	 WYSmEEhEeFwn/TbIdXl+m4J44+BVKsvd9AMnRh0H7sIxbXIQdj3tG6MpqO1+6KrWkp
	 EaO91xhPH3GObvlmraXUqSRi/U28AF4MX5XTc7yephBiz81xMqwdG0FW5zzLIVmU7W
	 R6OfmvTZu3lDA==
Date: Fri, 18 Nov 2022 21:33:09 +0100
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.2
Message-ID: <Y3fsBYLMnxcvGKBQ@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock changes for 6.2.

Best regards,
Jernej

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git sunxi-clk-for-6.2-1

for you to fetch changes up to f64603c9729af406167cb9beb66687b1abc4196e:

  clk: sunxi-ng: f1c100s: Add IR mod clock (2022-11-16 19:49:18 +0100)

----------------------------------------------------------------
- fixed header guard for V3S clocks
- add IR module clock for f1c100s

----------------------------------------------------------------
Andre Przywara (1):
      clk: sunxi-ng: f1c100s: Add IR mod clock

Wei Li (1):
      clk: sunxi-ng: v3s: Correct the header guard of ccu-sun8i-v3s.h

 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |  6 +++---
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c      | 11 ++++++++++-
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h      |  2 +-
 include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 ++
 4 files changed, 16 insertions(+), 5 deletions(-)
