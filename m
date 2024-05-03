Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3FC134B1
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 21:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714770214; cv=none; b=FbIpLznD6VniGMFULkH+Xz2tmBZXUrXhZheKuot4EBFtQSDL0BDM/S8nrqT51AQzF0s9BTHnVp6KagWkD/CFP6arijDoXp6kJ2T3YzHieHa6fxy79Q9EHBCsp9q1pIF0LRm0uy+WyKvGG4s6sPLC0u0TtUVAAX7VOQm8kykXeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714770214; c=relaxed/simple;
	bh=Rd8OjNaRvWOeeFwsUuLYY+v1uRTD/QKNpcqqy3mvWT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdR89nFxwF21BhtaoS7uEkApuUAEXsKAgdt4MX/yJoL1QzcimhHsIDqWkTeYp5jZsQKQNPeGYv8vlAvdAlp2pdnMtOWOrHqw6DbRspyA7b4Gp4h9s7aPTaSvQpHtDOzUjD+v9ia0i9pyHXlbbncf9zSSj0QWMlQx6szMpzTEzGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rwuWYRvZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rwuWYRvZ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so96587e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 14:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714770211; x=1715375011; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd8OjNaRvWOeeFwsUuLYY+v1uRTD/QKNpcqqy3mvWT0=;
        b=rwuWYRvZmaE2JTqQwRPIBMbh9Pm+cZQeXLgaNMQvdI3UYb/v09WovoB4gBLlTp9Hjr
         mGoM0dY0xrOaEvMImO1ZNHDXrgVEn65igUOyrYrtYhXVGyi9xdaqQjTc4HHsWkbC7Ee+
         reO1mU2sxQv7K/FFm2+rlRgnR6NgA65zHUVfBTBCitHJD7qC/VGuqJjU6JNCM0L23hz6
         LJpLWTHq+7tmIFpRFLShWunpEnDdDYnaQWjTdazjQKyzX6fFJRhyAH9NeJQlK++mjoTO
         HFtjabtxDfYbw4vj0n4Z/dweU5EyHYIIBHeQORstIGKZva2TolHveUugtz9RfFm9NnXU
         G29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714770211; x=1715375011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rd8OjNaRvWOeeFwsUuLYY+v1uRTD/QKNpcqqy3mvWT0=;
        b=vY65fWUCYMlhMwv/vxPJZFrlqYvRzGWenUCCViCVBywUMyC+riX6Dzb6pnKAhqxLOi
         D0lWRk7YAVs2C1StcyeG/5LyZr41T2Ncui2d33azb171yaB5BFQ+2ne5DXHsSM+kdw8U
         Ju8A8DuM1cJuSZ2j5gPlwGrJ6mvEeSDW6z79Iu3mDBjF6dnFg25hq7nHWryokaWtxHPv
         qSZBzbAfLZwwmpOtWVKAJ5rE/GVkhIGi2qEFIC/QhfcbOFUfsErgOGxU815PKTWEqn14
         rJX3RF1E8RUkugndq1eKb2KJlxt13O/Eq5izw6QPdQn4M1Q5LF961CvJHxn66Tj6f0Mf
         9X+g==
X-Forwarded-Encrypted: i=1; AJvYcCXBmVg8c/N7y4tmI5FUnhDzvlNPU1GcTjJ6rE4rA9JrIQN5YBVhQaPMZZGtU8uyhwifp6L+fdX0jy15TkzIRCr1zMBb8wuvMDbIyiA=
X-Gm-Message-State: AOJu0YwLXMzGD/DBKmEMoBYrAVGNT9sBFgZG+4/MSiNk+WRQeoVGKNDu
	V5GxFcAg9rMS56xFzL2b47esw7RNO03G5CaDtc/7gJncDOZYtn0hNuLfal3Hh5H6E/8uB+h7uc6
	oKP713WLkYhFxZtCDPNS92bHykKIRa4jGn+eNJQ==
X-Google-Smtp-Source: AGHT+IEwpEu81rH/FVNGePHBQCeqISBNzWjs4+w0Krz4xOnwCzY8XdmmXYuma+LSuWoMAtSFSqV0h7lUFLzfoGC8UUs=
X-Received: by 2002:a19:2d5c:0:b0:51f:5760:dd34 with SMTP id
 t28-20020a192d5c000000b0051f5760dd34mr2358407lft.55.1714770211432; Fri, 03
 May 2024 14:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-5-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-5-cb7624e65d82@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 May 2024 14:02:54 -0700
Message-ID: <CALs-HsuS_DWoUjwF0ozLH2drWJ7VzfdA-14XocsHNXt9CTT7Wg@mail.gmail.com>
Subject: Re: [PATCH v6 05/17] riscv: Extend cpufeature.c to detect vendor extensions
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 11:18=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Separate vendor extensions out into one struct per vendor
> instead of adding vendor extensions onto riscv_isa_ext.
>
> Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
> code.
>
> The xtheadvector vendor extension is added using these changes.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
