Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3395523DF
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jun 2023 19:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3053C433EF;
	Thu,  1 Jun 2023 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685649164;
	bh=4tilUvTgBjM29OIuZO83iumRSgCl/pt+Bufh787UBrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNj2MAbcvqc6nlP6wQ8nUP9aH8oaWGV8dnw6qRKVMs0fUFghMSpFljYfNLEum6S/y
	 ZpOEsnO/KPcnZnJtEm4nmgny7BYK6JqHJ4l0wV3KSqzrgWjnKFmHzCy+tmkbwUuEo2
	 z6mqn1a+3ld84M8N9cmyjelLFBTngfC3vhFKB8LUOkhC78xUPTlUFnx5oBbx2+sAOj
	 SffLG7TA0GK8f0OOjBPKbVVIJ384R1nh2KhWbCq1Q1i86J16w87jO9OBxQaw6MjOsf
	 dk/t9gDDpBiROOR4csEZoG82Ki3vQKzT15jA5oUOs1BhVutKg4yk/Zq90IzR+UXN96
	 HEi/7Pdm9yQhw==
Date: Thu, 1 Jun 2023 20:52:39 +0100
From: Lee Jones <lee@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com,
	Shengyu Qu <wiagn233@outlook.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.5 merge window
Message-ID: <20230601195239.GM449117@google.com>
References: <20230524000012.15028-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230524000012.15028-1-andre.przywara@arm.com>

To whom it may concern :)

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-regulator-v6.5

for you to fetch changes up to 75c8cb2f4cb218aaf4ea68cab08d6dbc96eeae15:

  mfd: axp20x: Add support for AXP313a PMIC (2023-05-25 12:35:57 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v6.5 merge window

----------------------------------------------------------------
Martin Botka (1):
      mfd: axp20x: Add support for AXP313a PMIC

 drivers/mfd/axp20x-i2c.c   |  2 ++
 drivers/mfd/axp20x.c       | 78 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mfd/axp20x.h | 32 +++++++++++++++++++
 3 files changed, 111 insertions(+), 1 deletion(-)

-- 
Lee Jones [李琼斯]
