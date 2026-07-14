Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27066449EA4;
	Wed, 15 Jul 2026 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115349; cv=none; b=ZRRNBVS9o77Mak5LrYoC1MEW+xgyKcOYcZMKccoM4fcikjiQ/AXWxILa+/AZotwiwCvKFpzTlemfesHvYNHZxlT+lkAQYlLrsFff6gw8rEbOGUm504Tf+LS629OjhxkwLSXBWaUQeGkqe8Ypo1oIAfXRu6SYPFZBWsEP1t63InQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115349; c=relaxed/simple;
	bh=HO5zuBKp6sDeTeysZpQX81axcXdOTq3CppdZUkGVwvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kfTjT+ktsjU9Hq/bIKoSlQqniCbxt1LFv6WZJdfdtH3kRDIlith0nSkfoNXbs8LTPkY9CsPvfptET3k3YEb32Ifgp593pxZrvNQ4Lpgw4Oc24m5emCW3nUE6c+BA6gnwU7Cbt+ub2i39UAvqTYaPQvNl3bInvcKPYUDplNN7j7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjtgL6Gz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjtgL6Gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441371F000E9;
	Wed, 15 Jul 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115345;
	bh=bLCKNaZkTvFdMYBszO5HwetTDpGyV874dp95e9MnOpA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CjtgL6GzIAGmwaGGXzcQ+3M+ScIvY99QikOTsVP6jnN+tE75OcNKNyvzBUKojhnP3
	 OQYSTcUuWvBPKoS+jIUp3Iwn9EnCGU1xTkSlf0kbA5NdxY3CS/tDCE7jwvn/a9hQMO
	 vqHll/NT53qkJBS9Hj3FO6fFV5FFJdliclYFyrhmMVgzdF0nlwJuLkJMMtek5GrMlR
	 199s85Jv39tye6BL8ViDy/49nQUyCDx9I9pcHin1u+/c+AMiN4uJ9GwfzyDfMcebQn
	 fID2XS2R/bAc53yLuuUnMCBFT7+xlMWtU88qBrY4kTsz/kmmxHu2dfLhXs5H5vuH8u
	 qPSbOoFiYFNDw==
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260714151950.316035-1-wens@kernel.org>
References: <20260714151950.316035-1-wens@kernel.org>
Subject: Re: [PATCH] ASoC: sun4i-codec: Sort sound related #include
 statements
Message-Id: <178406398767.7661.1702188321894054954.b4-ty@b4>
Date: Tue, 14 Jul 2026 22:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HO5zuBKp6sDeTeysZpQX81axcXdOTq3CppdZUkGVwvs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV3CPBThu9or9pVz5WuIa0CmmrVlHQ0HJGWKoP
 FuXgzLhm2SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaldwjwAKCRAk1otyXVSH
 0DbvB/4r3kcVlDghUv3Zxd/gvUn5SrhcLAL3Dgxug4JblzSbaQ3Jy16FWNPYB5qdx0yGCN6NO1T
 HSvlzi2nSuRvrgC+Jc2qoSiNH6CKoLJM4liiXu6JL4okZozQQLRnHmAp962tPEWb/zlrq6BsIMc
 A4dwNhGdlX61tuOLE4hMa2k0UmHnuwCxpmGdeOHr2twyO2pFHIk3a42ON1Z8grd25Zs4A+I0Rgn
 e2MPCiPuCA80YLzPhcs1UHm0qJj6uW6HdkvSZty+zBwni5wJEKLf1f8WlRktSszx+8obCOFArBy
 3+gNH9NSOtu+/34aDXLRYDtSsJ9PMRXPflnkTZLhM8O/4AUm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 14 Jul 2026 23:19:49 +0800, Chen-Yu Tsai wrote:
> ASoC: sun4i-codec: Sort sound related #include statements

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: sun4i-codec: Sort sound related #include statements
      https://git.kernel.org/broonie/sound/c/eceeb7a564f8

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

