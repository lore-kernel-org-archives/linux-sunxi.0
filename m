Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74854332EB6
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983175; cv=none; b=BL85epfakd6i93vsfCmAkkShDlyoKMpkbPXLKyLEe4ZiiYG0MegnO54ytpJcWFAHq8v8XrMj6DDHx18KKZaQrrYESZ1N3/BVMwmjpX6q7A1OQEYS+aBDx2wOjYIMO+1epBN0JbMJl7V5jWvG69iLkDT4LY/EGK5DCEigUu9oiVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983175; c=relaxed/simple;
	bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkC3b3BuG+s+JdbSIkdW/suiE/+J4hM48jrtVnqK0zxm3mBN9vh4/1/RQk0b1iG4lxISrHzJR3aVZcq0gG9tfTT5xFlLuJyWW0tXxt8mUPhmpKvE/RWhjDSuRqDv4ujMEPngFor7HCLLzzQgNyUILJgiVTf+1+pdgyt5tn8sL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN/ltygk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN/ltygk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-427091cd4fdso2086398f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983172; x=1761587972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
        b=mN/ltygkiQXTzK1gV1xrAvr2hLuvypdDF4yHzaYZ5s3n90IlINnt5Ejs0ushFU1Odd
         pM422fFLf1FOiwSZVcbvFG7MpSX/KNpshg3nLlbGloV2eazZQ9DBaAoiFpjsS+sbf4z4
         31JEE+SXyRbaDhE3Q/fZSOABAVbgizkb+9AeYoah9V7xIF/w3W7LhN8EKI/SGeGxrWYU
         x2g+tFdBPziXNnY80X8Gp3Djkuo0W3RrVIN4nc4Zj32+TazBaUtUR4dpw/KdjmwDFHKd
         3Yshh5KJdZSRwgrhvFfbCIQjBcNuY34KoMJto8iC8EbOtGSnWt5hdTkn1lrtLxrjZ/I7
         dhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983172; x=1761587972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
        b=Xo7oJ5Yez04HjNDe+3XnLBZD9R4Im4h/cCkRpcfVq0Y+83etFi8lxSpW80qot0oi5r
         lL8V5GnkTLu9hf63UTKRMRMPjuXJ05bT2wVGrm6kymQpCx92mMZZRr358ZvFG/xSmeuP
         qArKCe/hlLCThrLWgdLtl3qN9WSes1u7zgTCY7JtFGk0oTfnuzUjhu2/Wzx3lDYzJBoO
         OvXn6BcPdg5nGY4P3DcPC9auBDJG7o3GAE1EKko6Og66Cs0Y1qM3RWuSzmXwVONoXQl6
         JYksdxGCHLn9/Fy4xqVvIjRYwn8aymHmKJK1Upm5BW9UzP3dEMqPmiYyovnD5jm+qvtw
         R4oA==
X-Gm-Message-State: AOJu0YyKsRtTci5AqCQDcMoA2r5luyHczXMGn74a96tblNYssWEPXVxo
	kjmT/aH1GYAg+0HqnNuAiZbyy00VsqWz2fx5mrK/Xz5Abe0XEjEs5Phu
X-Gm-Gg: ASbGncvgscgTXjpllokb16ekN4FRQEwtD8sxwoxaMOk9/F00nJO0K5yLz+Rkg5tfEWO
	Bw9NRf5+UN6g778fQYM0OkB6Hf/HniQSibFZuo9uUNA84H4gc+3HJPgo3vIOCFK8b/ousCqnjAM
	a/igxc2nqN5h6fhPIptCdNYNJPuXg4Px2bfezzQXxeY0yrHBEg3+oaE9IRSt2ncqUIRVSA/Rzih
	tN4Z0sHXYhK8LL4M+FLcLgyhXJLtXUtup8Fe7Cv32xOYzVUmPWwPb1x04U6kcyaY2Pwg1vZnECF
	6QEYlwn9+OhVg6myaKaMHXQKf7aUdvMpuPGbiIYZNZataqSPyvClBgD35PLXhPo8Bplkc+kEwP3
	oRESAb8hodxKvLqd7AtFcwwQDSuyBYy4RjHVCOJCcLdiBB+IEtvNpt2/BqLQ3dI+2mTQRC4vKH+
	ttrxcsqSnFhwzIAKf0LfID40GN2aRf05Yv3oG6P1fiDd248AHx5rWH3JoUFsqfXxGpxqs=
X-Google-Smtp-Source: AGHT+IHtpDIuvy4/yF6LdQ4qVWSEOm8AetCbAHS/ajv9TB9bfuiRLOt0expo+wltP4XyjrMHK3544A==
X-Received: by 2002:a5d:64e4:0:b0:413:473f:5515 with SMTP id ffacd0b85a97d-42704da2b6bmr9352936f8f.48.1760983171751;
        Mon, 20 Oct 2025 10:59:31 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm16822163f8f.28.2025.10.20.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:59:31 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 09/11] arm64: dts: allwinner: a523: Add device nodes for I2S
 controllers
Date: Mon, 20 Oct 2025 19:59:30 +0200
Message-ID: <3906069.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20251020171059.2786070-10-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-10-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:55 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The A523 family of SoCs have four I2S controllers capable of both
> playback and capture. The user manual also implies that I2S2 also
> outputs to the eDP interface controller.
>=20
> Add device nodes for all of them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


