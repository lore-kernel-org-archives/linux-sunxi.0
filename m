Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E993AFD17
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Oct 2026 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566810; cv=none; b=lXlDCts+ID/jx8P4zdyeuIB69dgMmrZvHM5h5oS1FXCtzwEDtSlD2YXyUl2Q0+mz1drC4LE8dR4dc2BprXRp7rnlvwpn6+BdCcfdkEOcKmYwark1w+vrNminhdMZb6XCbKHlaBOYsd2KTmqhVRnLzpnxjVOu7ueySdvm2/NqPAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566810; c=relaxed/simple;
	bh=MY2lx9w4r8Y9Y3EVJDNhS3VK1a0bZ9WFY91oMjTC+HI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eq8aMIesJgEMqlSZq69kdEZ2f5lyUv9Zp71UBqSEjGp+0H0U7TZHVp6XxHak0BxcCALbTpc0Hk+vszBzTigJ7Jt1nWZJDlySMSDpA6sohJ5Vs97b4EMEojnHUhbF+WAAGsk1CbKzjykR+83rOjGWoX0YdPjJX6diiPRFETKpJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnuJppAZ; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnuJppAZ"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6dd7070699eso67921eaf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Oct 2026 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566807; x=1792171607; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MY2lx9w4r8Y9Y3EVJDNhS3VK1a0bZ9WFY91oMjTC+HI=;
        b=jnuJppAZOk3OBIyLCv6mnbgcBkjN8l3Kga3VQzDlMpLWw9LaXsCEq0GTRXsfzEbc3k
         Iq/mXvwVg9g/tiGquJvmO4QleZGG5Uz2CyjHM0oBh5SHbB02TKyTmSS1pEMMZoNmkavo
         dEMURCYtl1u0nKcHvOdOUiQO8Traj5HhI1/hVOZ0zv3M/0OSHW0zxnqMXpfE5bGJZLvm
         QKJL5/aprckNfc0FrBrTc1MTEZ3yUi/J4wgn6IQHpIbtE0QZEI6l0dasuJOjHg5FtUJC
         /x31juRwC4wNxixTSMlpjynz8yhwKu0mC+8AxKbWcK7F6shSOPLv0dDfk57hESHNz0My
         I8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566807; x=1792171607;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MY2lx9w4r8Y9Y3EVJDNhS3VK1a0bZ9WFY91oMjTC+HI=;
        b=Bq2sSkrOb6ppdY/YA21uwsoVCGL/NhnfE25YFBIVqA0cl0Gqi2N/CX8/LC+8ZKZ0T/
         nKrpxW/gwyrEOu7mN1DnGHYIUe3D0pgzngZ+Mg3NVanfVucfYj/t7rwTWDeBbD4ConEW
         GEaHj3AXhIdxKhB0KKk4dvthJ8DK+9b70wxrvrxSMY6H/REW3+gxwrpoFWjpYIOlbxBp
         532dRqwaFJb4PpX2JMCzBzyLC9qnCrzWIqfjRx/2uW2C88Bqlw20H2aNn0IEpJBBqwpK
         88Ndr/shs1dK8JbcmxF5evdxEojiFNg9TXZM6hJj/IZ83IIdWfALQkYJf8C1KezSeU4e
         M9yg==
X-Forwarded-Encrypted: i=1; AKwUvBzPdmOf1QurGaHK1XXzBWCh/dzVUpJo0553Qw92KHF3haqo1pRku9fgJuvxsRHLAla5+rbZ38fJqJObNw==@lists.linux.dev
X-Gm-Message-State: AFuF++muo6VOZBlh9HhawWOIPgpLZeHRVRW3gMNdbuAwcJPJa2Es5i9c
	GM0IJmOYulwVpKeya2wGq0QrY7H2Hz1S3sIj+sXgQMBTiRtF64zZY6bMarmBcKTnxs0=
X-Gm-Gg: AYBFou1tcaAevYKqLFBSIT21HZXbVUfS0LHd1vjbouhZUc4TcwuzZYyMQW5QBEUQo8C
	Qdjx2DQS0k7NCGThlBCOGjQLJKmxHTOPNflmhkEgrsuuI8iudncwtlG/B0jeGgqlugXoCpE1SIz
	vl0CiB5LYQzz8OLdPaT+Vr8147pQEi7gmVRMogjLeiFSeBoFzpidytFfwv43LDEwdngHMzm7Ykz
	WgubM3e6NGB0+d4oBq87ozz2quVI83b47hXsaqco1XypUZXjgis81LQEB4pWmf+AokSyWwZyr9x
	OYh0L03GaMe4PKabAg65NHvqKggPmR+4v5JsII31jJdMsfQ83hSQFgQrHcxF25mmQ3U/N6H6i7m
	gU2FSUf3N67FLcp4/AWYVpZY6YMgvZdSIEJR0rdrj9ddkgP9M0Ta7ejudbavcDh+uXAJr6TTtEM
	ZDWVBHmUhNEotFVnEci3iHcJBXsnS8HujUD9qiqSANu8QsONoFSxgODqOu/Ts+2onUjs2ti3Prw
	UYP3rkNYnpCVfNl5dg59Qd2/YDJvB+6xNwYHtD6pUgYI1/zsJF+hDMJsgBrRZlBOO7gc24OPhdZ
	l34/k4jOiiVu70oK9w==
X-Received: by 2002:a05:6820:4c11:b0:6d7:a325:35f7 with SMTP id 006d021491bc7-6ef129ede6fmr1932680eaf.81.1791566807345;
        Fri, 09 Oct 2026 10:26:47 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a850b675sm2499746fac.9.2026.10.09.10.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:26:46 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.u-boot-project.org,
	linux-sunxi@lists.linux.dev,
	Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/9] sunxi: Add support for A733 SoC
Date: Fri,  9 Oct 2026 14:26:32 -0300
Message-ID: <20261009172633.357866-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <46b973a1-3c3c-4321-80fa-a929375d52bf@arm.com>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org> <20261009161409.256732-1-vinicius.eduardo.pedrosa@gmail.com> <46b973a1-3c3c-4321-80fa-a929375d52bf@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

On 10/9/26 18:29, Andre Przywara wrote:
> BUT: it might just work, and then it's good enough for that time where
> we rely on boot0 for DRAM init.

It does. Without the SPL header, get_ram_size() found 1 GiB here, and
a PSCI reset through BL31 still worked afterwards. The probe seems to
detect DRAM aliasing at the 1 GiB boundary on this board.

Thanks,
Vinicius
