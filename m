Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493286;
	b=r8U8U8rgj1/egz1O78ZkAeD88jRswLhFIefzHQpXC4wCp64U0FJVVP8twqWFAD+SCWpX
	 45a1tScr/Da7ikImALk8iIsnkYama47H83b+jbvYWCNvfIyX1Pc6C6MVlTcAdWGreHiIf
	 eLg23XqcBgxFhqlGRtZa7CFBMpOvFNiOVTaINabUWnrjdoN/21DaV6rtsHOTdcAjF6eC5
	 KWf/ASAKN3fhNS3HhkQ4jW/lnri4YXXB66Edub/rM2fwmRRaocteAwFL/C/Jv1o+jjAuQ
	 P0o0PhwHD8vInfAvjFpczos4B1pmYHtjYCdhbrfRztc7Q8XgJk7aO5X0CT1qjZd7UbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
	b=Savua3exd2G7+4m3AxljupJJh+bBB3H65Ef3TDN3UCFPikna0Dm+9uRfph+yAfPPJ0po
	 2UmUPl88f0iytsLzxJ/3rynCvJegAWbAmFb1TtnlKgcBtSFZnNuKe3RYRNB1hKhWJc4NT
	 /9KUJYT18A0PErTgKNp3vF0bpfHwsnX08WBdE6bdHDv3OeTQLit+5v6MFujvSjGqAewJv
	 aCYpQhMmXYI4YmPRSBVXK1UDn8G3yrgicfX36KCjlt3CP7LwzsCr7ZDYcYHUKdUBdfogX
	 X/AhferWea2UkX1hKa9XLWiyzzbgVtrEq1SQEYPGDARuc6l+BEYSPsyvk15nZOmlY4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=etRc2gsz;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257DC60A260A
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 10:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257DC60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=etRc2gsz
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36661f953e4so621798eec.1
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493285; x=1793098085; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
        b=etRc2gszM5juoWIyWE8B09ox+o2LHlWAYcI3w3fNquS+p5fzU9UA4h4X5ieoaV2MaT
         H6BJE2OyEwtpsTKn4UbszBWrnujQMdWAaPemM0VJmm1BnR/q2gw1HwAUoD9cc2STTZi5
         e9RLbbYcLnGa/2um42ni4Npqf9PrvxDE0HhYvCHBk4uiFz2tEDxC56+39BOf1VP5Okyf
         5WI2sBt+7Avba9/YsCVaC7MdAuWGVMyZzSvkg5+b/N6ZP0EkO8fYTOAHN0ZIuESMGdhY
         WFQb1YEqLVnteR7SlSyGDTcfGx8GfxOW4tZqGGk9QGELzOGYPlSoCg6yEmRi0UtMs3Cl
         Y0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493285; x=1793098085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
        b=XRKGdugZyZAtG5Y0cHsbGwpupFiysPCKGd0TcIvdFVNTV2GIYUJCpM58mQMWgvihtT
         BgftoeS273aV+0KDrzuVMkrlitU9BDkASl6fz6HFQG9X0Ky4n6NerZhXKj50C5ypE5TJ
         9Nul3I2AkMsXgcOcBYi7BzwTWYWGViHh5fxJyjKq8zRuUdMy22Jn8Y0ASQ2MLmz/oAIz
         HoSCahsSIczfHnfpC2HX13WFGsZXUGBJXaXRXXl7ghgGM8aoYE2R0g6wX1TwBDRy4TJQ
         chkBcWIQx927E2tyxGX5u0uH8xiSPrKJPwhqsYEVJd9CpwjVb08q6YCdHm0NIPHOEqzM
         3GrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGP8WevXcglWIa2oo6v1J1bsxgDxbNhXfJEdzaeo+epSoWlbZIlxVV+aDMHAoMwTCq+6YgauCQVgcvYw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJmLo0YNjCOcKnsQEGCjnA5iWRrJVaHtkO5rTmiqPW4a6k+VRhz
	Tcs9B50wNSjN48KQKbfwNNH37w660Z+K+hkRe4HX4n3EEIr6kFOW8Qfe
X-Gm-Gg: AYBFou2XQL1JWoOFNd4BWcRSKrvo4yim9QezJ/Mm//3ByD2uzC83O3nckWT5KHefvDy
	cDsNar3xRYf6zEKuJr9AwL70E8j0PJilL9RKpVPgAbfVRuk3pkFW6gjwrU+TCQ9uqdYuCLbAt6q
	vG762U3t/fq3UTkxU8+A32EuXvmvVtc6FwQnIujvCYdt3K8s6QD44INXG7nQ62ISrWnuHnfE5hu
	FluMUfRDC1I1ZU0Nx/hJMIoQJjHYKDdysQw4Cayr9zozzkl3tJkaS62ctMY02MNXUPOMyqf5QQ7
	ZqaK2Ir0foxR1BMZXr7L8XFwXr+7p7dtgQaOv6RIQbEfQ/cSJedQzCN3ZaNJ3LaV+Z8nrJyFKvj
	rxkz//pSmTktOPU1jRj0glEYA0ObC0EA25/udOGCZn0gSdvq3Gw6JFjiBGDMfdyCYdqo49fJzlx
	DAVHsvELFfO2MWH4tPFGy5vESLMy3CkdsnHHPeo75TexoQPM3j9/YBmJyatShDhw4kY76oDGQZn
	ijJ0IvLtc3R1P4KUZ34ePaHqhgnyGxl0SQDq2ludllhUvfW1etT6DaLWqJLtKQ1/B/K/P1D6iAx
	fydYx7Y=
X-Received: by 2002:a05:7301:4305:b0:35f:227b:f8bc with SMTP id 5a478bee46e88-361a1465355mr13074342eec.11.1792493285129;
        Tue, 20 Oct 2026 03:48:05 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm39596320eec.14.2026.10.20.03.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:48:04 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Tue, 20 Oct 2026 07:47:53 -0300
Message-ID: <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atcrpTI_R4kRM8pb@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <atcrpTI_R4kRM8pb@ashevche-desk.local>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On Tue, 20 Oct 2026, Andy Shevchenko wrote:

> > +		/* Keep a hook the driver has already installed */
> > +		if (!p->set_divisor)
> > +			p->set_divisor = dw8250_set_divisor;
>
> On top of my previous reply, why is this hunk needed?

dw8250_probe() installs the BUSY-safe dw8250_set_divisor() before
dw8250_setup_port() runs. Without the !p->set_divisor check, detecting
DLF replaces it with the dwlib setter, which is the BUSY problem
described in the commit message.

> In the case of existing _set_divisor, do we want to keep the possible set
> _get_divisor as well? Shouldn't we introduce a respective _get_divisor in
> 8250_dw.c?

8250_dw.c doesn't install a get_divisor, so there's no existing getter
to preserve. The dwlib getter is still needed when DLF is present,
because it computes the fractional part used by the preserved BUSY-safe
setter.

> But now I see that we have same function name in two files. Can we rename
> those in dwlib to, for example,
> dw8250_get_divisor --> dw8250_get_dfl_divisor
> dw8250_set_divisor --> dw8250_set_dfl_divisor

I'll also clean up the naming in v3: dw8250_update_dlf() with a frac
parameter, static inline after dw8250_writel_ext(), and the dwlib-local
helpers renamed to dw8250_get_dlf_divisor() and
dw8250_set_dlf_divisor().

Thanks,
Vinicius
