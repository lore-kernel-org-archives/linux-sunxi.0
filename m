Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840AB202992
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742732719; cv=none; b=aleZrBjL95hleTgoFFqVd11sBSw76ABuh8L3Br49nprWOb88EYET9XrN5aKsO811fQeIg6yfQ26pwjv9PxVdVUfzqgqtsQ/iP3zw6uPOtcoHsR/HznaJiEs+lfvr22DK6KJKzCPAZ0hKL6tpxA8maw7ywjAvsgkjRa0ug3otDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742732719; c=relaxed/simple;
	bh=ee+sGWgGTK7JKIeN/br5tXXgdVIdA7ECbLey1lC1x3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HfvuOMIp4iMI6b80sMWbpFIXD4PEnrFZxFZMcHSjLtKFmU6Z2m3QGlBOz8uD3tgpvTr/7/4+BBsLp118Aj5KQRIYH7oN0FZL2LLFaDiJ1n4Y8m5ujr6Y2jTTOYo5Gj6CIUOp0WJqepO14G4VkSpoba1QaBo/4ZrHOVFx4ee0Ijo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5SRpw41; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5SRpw41"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso25009905e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 05:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742732716; x=1743337516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee+sGWgGTK7JKIeN/br5tXXgdVIdA7ECbLey1lC1x3Y=;
        b=j5SRpw41sVtY3NdJso8L4hqOKLF+P+0/fvrdCO7b+o+3rJYZxd6EfGXPraG/b3pqn+
         mHBGJEaXvP5rGxpfOrJfmmv7dVnjyExdDIzwvh7Y8Jv91SOnoTkS4rHPdp5AZiqM0Nst
         LhU2PxE/uU1PGkuNcfmMibidPHGrDsLkFS7oXpwlRg8emqyZsai6/v4atnc/qt8MeGLc
         D9dBLWldoM5Ch506Drq3X8ILSHEHxidXFPDRMIltilrObbrmAyxbsn4aE6ZBDyKltKoU
         qbEaYqTaqj6vfJJim3UNTVVTj/TVNBS5PSWfOEvOh/keTZi5DHTMuOToNnT9/joMQMe5
         S5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742732716; x=1743337516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee+sGWgGTK7JKIeN/br5tXXgdVIdA7ECbLey1lC1x3Y=;
        b=G72DWfSO+zPhTnVU2FJVnYjZ8SYh9YUCxPUV96ZIWD0DnZBl4aCijwzBHqP1R1rI21
         0wmVY1FSrc+y1khWGRlVSkWydMwe2nW5gYlCnQteVQiAVhjms9OgKhsUGdfR26DyglTD
         m0vtM2E/zVBv0RqD/KuAj++nIa3d6LyqyKpzTeid+dj/tsQaZE6aYwjyRdAyKBXbVHAy
         ICern07hBD2W2L3eHxldv/j5NaieLo1azHcDI0+PlOUXnd4fJelULEYlUzR09ohvLd1h
         oxzG6J17q4/X0Qea3S0JclyJvbL1W3ZOgivOfbv+vDgKFWrk/fwj1Gn7KRPkPKLMOVFu
         HoZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAls2qH21+FB8zmYiT+mMn0EtOCVQTFW7NgiBqTylaKWllrsWAj8PxzSij7plt5DSQ+TW1d6LtRsbV0w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4TL5Eqac+huUw9fLubC721HXMSYJX/qy9ZcQdFjXAOQEazOhM
	M94cln6B0EtuwYQUdV5KZhI9m7cf3I2sqDLapyT1/O7x1PGCxGQz
X-Gm-Gg: ASbGncsFW5J5qgackb/j7bmG+T5/lwgCs8QE0PjVL+LjdG5vQurEEDai/vHv2upRZFZ
	AQjDtUdWK47ktu5UFRCweVpqkrUS9z6WKUz8NyZPzJ0HLiFWdVcxmacGGjZKRD+PPXpA81+OnLR
	1yZqLXlxFsZKpR1Sam4ZgGUyGjFG/BYWBHaSGtJXn+heZvRK0jTKORTCuWjKYAEP1PkCjj8Rrpb
	tNLmRbsK8EmDzRwoJhXRRtE6Qte3TSXll2fLhXH3L+ZyglW72Vjif1Cl56crc8giLJaQTeKIa0m
	eJP7t9LHWoZybx3XtOHXG5yJ/Ld3e8w7Hea1s94nH5CXHU+f5Gpdesr6TfzX+ao3fTTQZGGVe7D
	UN9t68PUflDOGX47sKZvI
X-Google-Smtp-Source: AGHT+IE8uyJWuvj8ibJEaxSDHGEIIeq1BaxjiAW9tr5cjvFVuAror1tC1awnTH/fVMkGKUYtHSzqbQ==
X-Received: by 2002:a05:600c:4584:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43d509f433amr82317005e9.14.1742732715641;
        Sun, 23 Mar 2025 05:25:15 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f3328bsm135495875e9.1.2025.03.23.05.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:25:15 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Mikhail Kalashnikov <iuncuim@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 27/34] sunxi: armv8: FEL: save and restore GICv3 registers
Date: Sun, 23 Mar 2025 13:25:14 +0100
Message-ID: <6031809.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20250323113544.7933-28-andre.przywara@arm.com>
References:
 <20250323113544.7933-1-andre.przywara@arm.com>
 <20250323113544.7933-28-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 23. marec 2025 ob 12:35:37 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> To be able to return to the BootROM FEL USB debug code, we must restore
> the core's state as accurately as possible after the SPL has been run.
> Since the BootROM runs in AArch32, but the SPL uses AArch64, this requires
> a core reset, which clears the core's state.
> So far we were saving and restoring the required registers like SCTLR
> and VBAR, but could ignore the interrupt controller's state (GICC), since
> that lives in MMIO registers, unaffected by a core reset.
> Newer Allwinner SoCs now feature a GICv3 interrupt controller, which keeps
> some GIC state in architected system registers, and those are cleared
> when we switch back to AArch32.
>=20
> To enable FEL operation on the Allwinner A523 SoC,
> Add AArch32 assembly code to save and restore the ICC_PMR and ICC_IGRPEN1
> system registers. The other GICv3 sysregs are either not relevant for the
> BROM operation, or haven't been changed from their reset defaults by the
> BROM anyway.
>=20
> This enables FEL operation on the Allwinner A523 family of SoCs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


