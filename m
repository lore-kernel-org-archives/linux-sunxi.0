Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFB01662F6;
	Tue, 14 Jan 2025 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736872533; cv=none; b=UGeXtIMO9P+BcRWcbqY7t5/GoGwxhWLUc0DmCG8cTjupPkmojpPrifMSC6easHCO8OOqU6tRdvR+1Ibt/gT2+R9ne6axRoDv6vz1jl4Rec1K2OOs4D718S13XPPC5WZlVRnBaQMWj7lwgSUuK6tgyEj4+/Tz71UaxMdkOrQH6cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736872533; c=relaxed/simple;
	bh=7FkvUm76EB1H4eG8siTlrCmRFsWt02YP+eTqvnJWGyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o+8W6/P+UGyFXJgk2vRK+uC04BWuBwPLkMD8QBEQDLpyK3Ddq4MUM8e0ecrKH/Dmijj9VbqvmTsru+FKnCq8GvFy+O0k8l1KQbi8XRf2AMhGXKhAtr1OX/oTZXGnD7A9Yrc63cb61QV55WQ73Ni7vCz5+i1AK4rNhCGqMpR0els=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J57Eh36v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J57Eh36v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478F9C4CEE5;
	Tue, 14 Jan 2025 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736872532;
	bh=7FkvUm76EB1H4eG8siTlrCmRFsWt02YP+eTqvnJWGyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J57Eh36vquih5n+k9qSVy5UotEzL2Ph8IpuHPnsXao1OyO8WzpOBAdaaxKmexasRk
	 CWGqqIxMDomILpY/HOZb/vy1MV3NSNLJSBZWTGRmtE60KBPuRWSuzh6kkMLtXg4gQD
	 pGNsEEhU0vCar0pNeYjdcSFse9MRfAMsLR7F44x08IGc5g0kXFkXdmdhPTJo1u/50l
	 VuFsQ6COE2Zf1q1goHbT1i0BxU5mShwEqgvv1uXmUqsPdvtWaQOGDtJiMsf7naZ7mp
	 jjC+11mOJDAS2M+O2QcloujhUSSWm+uI9ojHt0YXC33WARrldKsw6NNBKuI1xHo6wk
	 PihfLLDjSBkFA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20241211222205.1915027-1-csokas.bence@prolan.hu>
References: <20241211222205.1915027-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH] ASoC: sun4i-codec: Use new devm clk and reset APIs
Message-Id: <173687253002.61795.10404801959017049784.b4-ty@kernel.org>
Date: Tue, 14 Jan 2025 16:35:30 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 11 Dec 2024 23:22:05 +0100, Bence Csókás wrote:
> Clean up error handling by using the new devm_
> clock and reset functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun4i-codec: Use new devm clk and reset APIs
      commit: 65880d32e1d7eb1ef03253c454fcd8f9d41aaa09

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

