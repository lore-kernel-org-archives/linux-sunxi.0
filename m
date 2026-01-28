Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A5219303;
	Wed, 28 Jan 2026 00:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560643; cv=none; b=YRpRoAfMHzs2FmIsDOZQGXrnr+clE6zm6gtevv5MtdLD04UAZIRD4SYASrFraQkhuLPXtjdEM8TIqmHj2/p0kD1F5KGoIA8/lPPzGHAhtdZ4KIx7+xgLFUzQNIaJX+ackVLDoyu2e5qXTVWKhbJf1ZWhFLk+xkI1aDjJVvTDHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560643; c=relaxed/simple;
	bh=oKNI+M3reVqWWwDmRdcVKum/qWaajHKiFykIl2BlOdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AsJRq3B5w/pfDHtynHGFIiqOlzlAIlrZ5RmvKAgASBPLmsXGPhw/N0KzIO3NpUjVoYKF9UoPA7tcPv5I9gCR0WfkdipUeEqyEZps9j0r73jU05EtRwuXsjlkNPmOGQCnYQTLgqETgaYYj/8G6sccg4ywJY0MbrZ7KMG58ZurXkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxZ+WIWS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxZ+WIWS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E1CC19425;
	Wed, 28 Jan 2026 00:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769560642;
	bh=oKNI+M3reVqWWwDmRdcVKum/qWaajHKiFykIl2BlOdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UxZ+WIWSwChTfPoISMK5xndaB6CL2Fp4/61xB8jEkBJrOF2g//+/IFqFaGRdMGFDw
	 Ii6RxH7jq4y7sjia+y1+BUlvndzj5IELQQBCpPZQacuKIsLmLKcxZDaWsxYMVcCF76
	 vUR0jWvj0NKLQLAOHciZE+8kXMH50nwcYIWcZMYZMRHes3JbHZTYL16XDXQcJrp/YA
	 5qnjupx6qmAbgwmc2hxpnym9W2SQf7YBqEd8PdqpvoPvbN9CuUJhzxPdC8WTd9L7Y4
	 O5xotqlNpIlkKpr2zQtaU1hQh57Ir0GTbnO8dNCmdHlARAMtzyPBZ3do7DAM3WMNvb
	 BIV/RQZPcaLIA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, wens@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, 
 ckeepax@opensource.cirrus.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260127034025.2044669-1-nichen@iscas.ac.cn>
References: <20260127034025.2044669-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Add missing check for
 devm_regmap_init_mmio
Message-Id: <176956064035.1483098.7074605449256070119.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 00:37:20 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 27 Jan 2026 11:40:25 +0800, Chen Ni wrote:
> Add check for the return value of devm_regmap_init_mmio() and return the
> error if it fails in order to catch the error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun4i-spdif: Add missing check for devm_regmap_init_mmio
      commit: 8ef73c0fbd1e15ead401a74e7114d8d4614a74cf

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

