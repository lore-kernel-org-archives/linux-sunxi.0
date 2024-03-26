Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB0713D62F
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491484; cv=none; b=CuyW4u4VmaCIchYwjyjkf2Zdl+se6JFqJUJbPOc/AmXiShPE25yxVMFU1dES6FSEQgdC48qC4Pg1YYZar6E3dJH44aSKpLW/f5LXbTKytL4hX/+8n186hMwIKpspd541H5LoZV4tT9XxpyLatobjZsTQ8oDUk542mDNA6xb4Ws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491484; c=relaxed/simple;
	bh=jZamp4MsOv0a0vk5eb1zcKU8x6xTFCXsYRJynilmCSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=endvNY1QFQC+nyTFuUqnMupHMtOIOEY3uSby7OnN6yWjrJ6aNfMpaMq5uANFLP9JudG5FfOAtAHEx/vLD11pbkZCa/H9l81+ZGRJoOmcuHyy7rOcpWOm7bbGqcn9lZgUbfXJ5H6m1PLR4VsY9aGJyDgqwbCcOHRlj+lzp2dTONY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5F4D7o/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5F4D7o/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a472f8c6a55so592377966b.0
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711491481; x=1712096281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzPU6QXENTrmR1HpeV0OvIjJ9OWKrJqQwOwJWoxqWwE=;
        b=c5F4D7o/OyaTu9qRglhd884mfalUZzLUVBP+t5xiYjyG5H1IVYgjK3049jLE9gdcGt
         eK5z2tPPAt8H2TAdbiN8uN2jXdjgX4poz2mJVzdbBQoMxqdbL2AziygONGKFxFCrNO9/
         wX2g4QL1aOsDEqpgh152UC49FtxagHp7MpGzDxPxvXEr0HeEke95alk0Z0ot01Eq/9M5
         o02k+DMaxB04f4qTbJ6uCo751ufGaCQBWb9kLshAjqHl7qYKkFCRACxMFdNAnIy6ULCM
         NI8x8ltr/1fWO/qJmiSzk77BwluGXrv1jDZu4gbTc4m5VvtUwMvpQcfOohZWzr9OTkCM
         MWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711491481; x=1712096281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzPU6QXENTrmR1HpeV0OvIjJ9OWKrJqQwOwJWoxqWwE=;
        b=nk0G+Dn7VkC6DLLhz1jfTzy+5EWs/B5E7y1tL7CRBCtua2u4MxUjKicUn1wTW/K4hO
         cMKO9LF22BUMUGvX63yIgYrH0hXKdKcUh+ktglljxFQwVha3u57WgP3YA5ZUJmDMUcpW
         /jHo3zDm+0BlkyLzIJXxFIkvQxMFJh6XUIKpfBbtQ/pkmB8ekjS09fynhBAZg9c8iA/Y
         a1b2cy/n1wZnSuiYXITWR6cAgBmXJdssrnGJjxWoMPIBSszUouL+n5Cz2ayREqULIHo4
         1wZ38rLHhBACddQpNTOCsDwjGOVON63XifYZJXi5L4se1IEHLGvf4Eq7qr2Zhs/wAar7
         RcSA==
X-Forwarded-Encrypted: i=1; AJvYcCVcBEN3R/JjrJNqCKLp964wZLqAPLZ41LDPEFmEzYprYBERhvj7nUhr/T+gNRFKKa6eTOgEazASBiE4hmlaxV782uKhN9us75rK0DA=
X-Gm-Message-State: AOJu0Yy2tE/O+zNyNDKqLyANY8X+KU6r2NDDnpTEb3oAWd7WhY0+KI9a
	N1txBtlj6AIgPik5CPIzSUJ2pI03jgJ1G81lKM+b6DG6J1945RsX
X-Google-Smtp-Source: AGHT+IHQFMA0QHnR8HNwKCAjD8+h5k/NmQkshAvwPkY848lMOrho3HwTvRtW0e4CHOIkhJUv0mft5w==
X-Received: by 2002:a17:907:77d8:b0:a46:65fd:969d with SMTP id kz24-20020a17090777d800b00a4665fd969dmr638521ejc.71.1711491481550;
        Tue, 26 Mar 2024 15:18:01 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b00a47152e6d10sm4663717ejb.134.2024.03.26.15.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:18:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Corentin Labbe <clabbe@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: allwinner: drop underscore in node names
Date: Tue, 26 Mar 2024 23:18:00 +0100
Message-ID: <5763839.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20240317184130.157695-2-krzysztof.kozlowski@linaro.org>
References:
 <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
 <20240317184130.157695-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 17. marec 2024 ob 19:41:28 CET je Krzysztof Kozlowski napisal(a):
> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.  Use also generic name for pwrseq
> node, because generic naming is favored by Devicetree spec.  All the
> clocks affected by this change use clock-output-names, so resulting
> clock name should not change.  Functional impact checked with comparing
> before/after DTBs with dtx_diff and fdtdump.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



