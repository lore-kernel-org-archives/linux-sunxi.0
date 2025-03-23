Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFA204587
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732636; cv=none; b=aj2MOeHUyd2eGEogRNQ7AsXDZs7uz2p9ZT8TAp9r42MeM3v7VBxOT1QeIaQ1Cu5mWTPIfgBqVx6IzltoRjEvtx2Yx4/bvCROhFqJ5xXi8fpnVRl6v7LyyNT2NdVLDZY+rCs1L3n2SKXMm8cCg0G4ysj+YPIoSCcGCTJrqTxLxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732636; c=relaxed/simple;
	bh=GWINQhEf3bvRFeXH/KZ/WkLlnUjwf83G9/Pzik/HTu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLnwGw7dMph4/DC61fzzm2vRehB1152OQ6Mj3ZlZ6xXiIs4ECLmxBGzku7nPQXjv7hmK01f8prn0zOrUVGoAsDXUJ292lc/f7B9j1wET6GKDMQvlBTEURPNLUYLtM+rfQH9gH2cV2EkhLlAKsvU2ZaSY29T8T89unJZ1z0hID7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQDMUAsG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQDMUAsG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394036c0efso20540835e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732632; x=1743337432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWINQhEf3bvRFeXH/KZ/WkLlnUjwf83G9/Pzik/HTu0=;
        b=jQDMUAsGYo/DB800YygsX0ghNMhmLuE/WeWVye4sqlG9WqhctUu8sa5BCPb0gXvCjD
         ArAdWTRtgDcwcDSHHJwPgz9yhLPkQE8C/mgP4abieCgPB7Vw0H5eqLl9TAiiadp0rkEe
         6kPqeQdU1qIefWjh9YZ3CPUVrH7YxmEjxVnQ12fasxCt1bDNF8Lq13lbBGvpSuhBc92r
         r+kmsSrf9GMeynMfIBCmGLUKEB6pu1C2Vflki1IRXgGx0Sl+Z27dH1Q/fJwJjvMVOCRO
         62j8yoam6c+Ew3jwi0k7EmNbGOeUqf00RxObwsE5VV2CC7NR4TeZZSg/DhL/4BUc7DVz
         d+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732632; x=1743337432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWINQhEf3bvRFeXH/KZ/WkLlnUjwf83G9/Pzik/HTu0=;
        b=bG6/KI7rq2Z3yTIk8BZ2DakZTp6dVAwNL2DFD/py7H+YPiFrapufkbuGmok9W6LOw+
         wl2/Q4hstqueNc4mgYa/muJ1i7ogek5ZxeufGkA7ZT85DR//izYHLkcBD2G8odeV3SF5
         W1kbY24aVjzCgpV8ciaaZ9bOxvOiOZO8KtbNyWIhpDg4G5PsYyDiUcMlqH68MwFlSMjn
         fRJq8Io6G1cdnnHJuY/Sqy6YvjRCqMh3Dyq5KQ9fBp4j+yw0O4tx1M0nq8zjtNBYjFVw
         YXQOlKfiwPQj4hAaqE3w/g6dNQhHKBZxqUgDQhbvfEDk/ZrhdL6e1hAPwKk977tsO7cR
         7+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXPW2j2LLBNQN03ABS7Hjz9HOjYSugaTwOpqSi3icQYwrNxCRvrDBDC6xr9x27LBZ2yYI219ko+EaSVIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YypO3TpRcEZhixALWYDEvLV825/FC0j57TgirJLVFARLSSkISA6
	H17fZTSWu72Frg5MBesUpE41txUiq7ByKP3EFzlhR3GvFhqa/IL4
X-Gm-Gg: ASbGncstaBQgb2aYBaftWoOnYwSne/kleKofSJoSN2wpp5gJKqT3NI+xqt2WSiVcL1L
	E6Lk6UQ7irzML0EzQ1e3Pr/xJwplaTE564Pljzo36SDqDKM9dj0sPZe5me12s6lMntqBY3Dd2sb
	kumiHmRwF4uFT9yMKj/bK5yehQxmvaba1AgT6eRw1iLlwVJLR2QjGQ8YpoUDY1+mmOJj6s8Wnrs
	Yk7Yve1U5ThJx0IRaBYIQYRqnQofGZGNFZgZ/ugB2v2jNIUEEloOFNfcY73SK0eSLMhJeiSFdDE
	pgzVMP4H3M0H28wo/xBrzODvRXH9aHKg64Xi6esFoiTbPpEUd+P1CZXW0KOlsYrMzIvIAnGk6Po
	Z7+iM04lMQ56vCNgd9GIK
X-Google-Smtp-Source: AGHT+IHWYIDykrSkcWLVoOhLr5WYBU8J30jGqcWppneK8eNXcXJO0NcDVZn5clllrdSb2RyUQ7vtUg==
X-Received: by 2002:a05:600c:4684:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-43d509eccf1mr78920555e9.8.1742732631755;
        Sun, 23 Mar 2025 05:23:51 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5536sm7850102f8f.54.2025.03.23.05.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:23:51 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 25/34] sunxi: arm64: boot0.h: move fel_stash_addr variable to the
 front
Date: Sun, 23 Mar 2025 13:23:50 +0100
Message-ID: <3865744.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20250323113544.7933-26-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-26-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:35 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> To be able to return to the BootROM when booting via the FEL USB
> protocol, we need to save the CPU state very early, which we need to do
> in the embedded AArch32 code. At the moment the pointer to the buffer for
> that state is located *after* the code, which makes the PC relative
> code fragile: adding or removing instructions will change the distance
> to that pointer variable.
> The "new" Allwinner A523 SoC requires more state to be saved (GICv3
> system registers), but we must do that *only* on that SoC. Conditional
> compilation sounds like the easiest solution, but would mean that the
> distance to that pointer would change.
>=20
> Solve this rather easily by moving the pointer to the *front* of the
> code: we load that pointer in the first instructions, so the distance
> would always stay the same. Later in the code we won't need PC relative
> addressing anymore, so this code can grow or shrink easily, for instance
> due to conditional compilation.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


