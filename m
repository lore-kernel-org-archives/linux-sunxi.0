Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607A21C16A
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766650632; cv=none; b=KlyAC1HiEEX7zsVhRJ7+NgC1yDXoUvf1KbHNeFqRmLhr7sQOx9Ba554hZwg7TSPOcG+41Jw9e54FYFJjwSUx7eOnbCjX9DNsviEfXGcC3Kd98T0ssOWG7XVGGf4CiuvrtAB2j22ZFS9r3pal5vzes5tfo5t6NSvK/X4K6FfGscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766650632; c=relaxed/simple;
	bh=rPaxfOiO2h29JkefBVMH87cUVSszE5AdBCMfSOGSb4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrhH1ZwWH18CVtib/C7TudEUkD3JXCbk945cw1Ie296vFPK1UPE+PHVDQxMsbr6exA603QnRR4gMRDThDWkEzMQ/43u0yUrP77DNKdTyBO5EdhubKcH7FQeZxN5pBCq6PA3oN6wpWHAkT1xJzO7bmmZwxOy5MLDtP+3espHTYiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWvQgYSZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWvQgYSZ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b81ec3701so9966314a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 00:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766650628; x=1767255428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPaxfOiO2h29JkefBVMH87cUVSszE5AdBCMfSOGSb4s=;
        b=bWvQgYSZQgHjqxbKTtGFKZ/NHNqXBoAQZIa3zgme3klBv9G5Yzg4q9ZUv5MXog1BfI
         b5iA1d5f9ktjYObcYI0WgvyhghGXgh5ZkulDxTFOtI2Vq7Qh9M8dR3qUqh8zhFzUipMb
         gGO7p8hKmHDN251GKetwi1yxmmK1f2DuH9cQtku7ZfW7rd7n3xI3sOFbB+aC0Ooa04iv
         wmCPc4IDB90IVT7xAMMM9lu/N8zOZNsQlPmeVTBH16he1lHLtzS24HxMQHypPyH7vE/5
         Dd2EofZYu1kJq70X4sCdMpjdg3F9S69ogg+RkiNJ9pwPzyLDCC/Fc9l1W60MwjRTCjye
         iVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766650628; x=1767255428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPaxfOiO2h29JkefBVMH87cUVSszE5AdBCMfSOGSb4s=;
        b=VQEI4d5U2h54S4xJjovZwlzxRwMnbYyI8uJK+AHhyS8CYITErBKgQ30o8BwvdAsiIW
         dipilPmCDa4w1VQuiPce1Xw5JiCC5HzBR9TylwaNbAiYErk+9krlDqIlXJoi9pGcjkZC
         sLn80T9JV9wmLS0OQpYFBTfwC3QhVP3CXOLdv4Z+3IY04aMBWvYTw6bIIl59SdoqMvNE
         OGLwZMN8WHWDICYzxZfKOSptCb8z4JTGSlmAG86SESfG5r0i2QtarDl7rWlPIvXjpBvT
         QSn7Lx6OJA4DVzT9uY8O9CJotsVoRYb4a9FkECTv36vE/Q7qaTOxwShUQ1c49l1SHfy0
         g4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfq0kQmeNIYiINDYS7i25VKziaQyPlPAbkSncWvKcX5Tglqy4fFVcnvM0RpwMe5RucbwUPenU5LH9N0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBGLzpIfLQC91tQLwI5MxEtieamhQyQk2fEMBkxY5myNcgQHRd
	tNeihtz5Wr41VSYNOKX0JK+H4vRvIe5G5Ks7zb9tNBfhIBhgyeAIqA59
X-Gm-Gg: AY/fxX5LsW1e9ZqsEzJ8Wf6h9Yt21JHKDot1tO3m2Wx2gCI/19REBa0Y7ydvTfYVnCm
	GmdShJO4bckg4jbscSB3/C2N73kH/CDfuTo+S42QO7aEEN+V9YJ06pF0SuzIQsUfLDFvn+U/man
	gNw2AXOP9sQxsR7VGxCr8EUc60gekXoj8y7baxyfcDuIrk7p10Janvzp5sx3oD6lZUDQCGBZaT3
	XayJRY1pF4GM/DptYoFq5oswOCcdRtv7uZ/7KKk6bi7SY2YCOK1sZRYmH/WpZuxPnbe9+YtL4uO
	OrRRtFoue9OEc+dxLQfIQRh8Lj5yGyN3qOOXypiXHzCag8472VEQri+168bNtCTd9nOQfYde1r9
	S+dW8Mpar2RS6T0AsW5lrsr5k1vS73Co46b4bdOFA50ktXlyLTUo4QaVRqeE4PZZY5XedL8xiip
	ESSB1AK2UUf6Q0bCAKIo4HXH1RTcQOqir9
X-Google-Smtp-Source: AGHT+IGNe9sOMtndqFQn5j/VZK78chHVl1zIxR7eHSZrsbZhnsAd9hS4ioXFMobucGxkQgjR7lC5HA==
X-Received: by 2002:a05:6402:430d:b0:64d:170:7976 with SMTP id 4fb4d7f45d1cf-64d01707bacmr16253632a12.16.1766650627578;
        Thu, 25 Dec 2025 00:17:07 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c03sm19322279a12.18.2025.12.25.00.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 00:17:07 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: axp20x: AXP717: Add type-C CC registers
Date: Thu, 25 Dec 2025 09:17:05 +0100
Message-ID: <2827385.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251225080241.3153453-1-wens@kernel.org>
References: <20251225080241.3153453-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 09:02:40 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The AXP717 has some extra registers related to type-C CC pin
> negotiation. They were missing from the original submission.
>=20
> Add them for completeness.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Checked against datasheet.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


