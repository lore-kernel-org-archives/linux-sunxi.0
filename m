Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A481478F26;
	Tue, 24 Mar 2026 00:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774313540; cv=none; b=heDiOtNWMuQnj1N54TLDi45rBv55wmu09LniuAcNtL02GHuQWJG940fWJGoK9o8iPxmgiK5fQHjQquWxzuG0UkyBlpBYbe+a6ecrM/tSKXaGtOmIwfquyvC7RSeriey3sXh+aU8vqtZWFH+7qVd4EykmIosH1s5UKnyiHTmgYs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774313540; c=relaxed/simple;
	bh=Kqmy4ocV2M8B5x1XI7enz01J/VpFK+natm8DU5YZOlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hCqnbhR3ZjD5DyZCjstnsGFX5ZkCQKp72YizS7nVj24YzR6LMuwyXgeTgM1WjvrBDknSYI/IXpb+gxbpPGlHY5X+S1Qf9lIdxg6rSPOm3LuRh520Oxrebj24TloqY0wfVta/W7Glvb4gX3HscREM1V1wSQRQiE+wk7uPuP+Rc1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmMIM0A4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmMIM0A4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD8EC4CEF7;
	Tue, 24 Mar 2026 00:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774313540;
	bh=Kqmy4ocV2M8B5x1XI7enz01J/VpFK+natm8DU5YZOlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PmMIM0A4qRK4cY1IJyrhbdXl3FSsQlbXlcnBc8HmDANbnFZIerfm32VeeChZ2uWzg
	 CVICPqxYUtc/p6uASO0kjeJptOM2eTMa+PQ7fY4q3O+ZA4fHAFjQ/+eK7ZiUt7p1a+
	 03Lgy53SRCRXIsLOxf7Dssq45/rWr9wnMGFDuaQq9OTy01oFc9g8M39t8m8IFVmS+t
	 6/9RjXPtckhONLewjMM2IRtG5PWrc0nX92PFiyIsVU/RXbVdG42Omxblgx6s/xukHX
	 0HpEwrYhVVyEPeLR0gVx7yuecTYWQRqQch0v+5kNRSvApdpKzKPleaFeiJckBFv2vI
	 0XhX8UFnwOsQw==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chen-Yu Tsai <wens@kernel.org>
In-Reply-To: <20260323172450.1259111-1-wens@kernel.org>
References: <20260323172450.1259111-1-wens@kernel.org>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Make reset control non-optional and
 check for all errors
Message-Id: <177431115354.811880.16400372395326630860.b4-ty@b4>
Date: Tue, 24 Mar 2026 00:12:33 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Kqmy4ocV2M8B5x1XI7enz01J/VpFK+natm8DU5YZOlI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpweBBH64WLacTjdO9ia+cqGaz97h1TIMLdZRvY
 KUpltXD9WWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHgQQAKCRAk1otyXVSH
 0HCbB/9SwEMe57/ws+kT/TSrY5Ar0bpNt/qWmRo7Nrip21CVEbhEXL9zv2CfEdKgeI9EpMFaQw9
 7hjeXTeEo0bAXFaQu2a+jeVFIeCQZlADacEmuxbM6yxZ3tVM8/zXV+8XXFiZfFIW7QeOQyywFET
 1sjHvUSClBb63ClQQUkxjM1dOsABERU/na9MsatZEi7azN7PcOvNWmbZxPsmr1bJBo3BP9763H0
 L2IOJR7PjTQ0LwComIhIQiPOWPWhwT35IHBzOMIvudXIdRdnmwyV1WfezDGacvLGreyNMEwvCEu
 YMyUYIVD0inA+MmCODLj+Hd1CHXpm3TS1jMZ720ANiha0jdo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 01:24:48 +0800, Chen-Yu Tsai wrote:
> ASoC: sun4i-spdif: Make reset control non-optional and check for all errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: sun4i-spdif: Make reset control non-optional and check for all errors
      https://git.kernel.org/broonie/sound/c/51b0909d0bc4

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

