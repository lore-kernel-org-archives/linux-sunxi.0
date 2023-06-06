Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEECA17AB4
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Jun 2023 13:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28642C4339B;
	Tue,  6 Jun 2023 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686058237;
	bh=Io1+FRfEzdYWTBjfKWS8JOKQ6OwVSNhb0fzsrha93wY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OroYe3efWHMpRPG+/9cs/uIRgR3zGjLrXTXT4U+0fmYZQDeFgPbYYspqW5PeyiHEr
	 4UuzmyP4c7e40H3uB7jVO2WVKFtqbLtwQJPhT/qVc4kQsz8y0paovPja+tHWgAQzfX
	 FEcqccw+hex+mcZnnmHGw8Eaxzz90YoVR/7IDIPaJvyNB31FUM9i2DuCzQtTVpaK/m
	 ypDqFOGzOw3HEnTc/J11h3d5q2Mu1pLyGM1TyAZ7puREKu4XDxngXKs5q6AvKMgWMd
	 rNBaRyPPVCFSk1xtkt2tZnZujZGyji8ck9heSn8Fhd0FWnwcY+qKDYLn1+UA9NdTAd
	 CleJ+3lDfuH0w==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com, 
 Shengyu Qu <wiagn233@outlook.com>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230524000012.15028-1-andre.przywara@arm.com>
References: <20230524000012.15028-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v11 0/3] regulator: Add X-Powers
 AXP15060/AXP313a PMIC support
Message-Id: <168605823485.29508.16853272522474310496.b4-ty@kernel.org>
Date: Tue, 06 Jun 2023 14:30:34 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5

On Wed, 24 May 2023 01:00:09 +0100, Andre Przywara wrote:
> this patch series adds support for the X-Powers AXP15060 and AXP313a
> PMIC, which are general purpose PMICs as seen on different boards with
> different SOCs, mostly from Allwinner.
> 
> This is mostly a repost of the previous patches, combining both the
> AXP313a and AXP15060 series, rebased on top of v6.4-rc3, and omitting
> the patches that already got merged.
> The first two patches are the successors of the AXP313a v10 post,
> the third patch is based on Shengyu's AXP15060 v3 post.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/3] regulator: axp20x: Add support for AXP313a variant
      commit: 60fd7eb89670d2636ac3156881acbd103c6eba6a
[3/3] regulator: axp20x: Add AXP15060 support
      commit: 9e72869d0fe12aba8cd489e485d93912b3f5c248

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

