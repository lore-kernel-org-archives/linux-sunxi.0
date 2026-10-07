Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A9144CF37
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Oct 2026 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365663; cv=none; b=SkZpmTsAEaqDmCKHv+Glg1GajChgK8rT3j1y8Xy0WrNF9xEhTIylkpeYop+4M6/eHDfQSzefivjZeQ7vRcvviIBzG95AHp/kL8Q/0UZILmCPpNXUUjljWgn4TT1E8YqHnenhpszKxMqvAaU6KaixEl+ex70Kqvdq5y87FC9vRRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365663; c=relaxed/simple;
	bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCJiiUyHzDhb0h8u+CMrlZ+iMTogrpW4TZ7kLvmZj7w9HkgGSOTE7mEm0E/bdxDvJU3qMoJBALB1zTzydsux99woVH49zp5BQ7ojWdqF1R2ZnQsD88ILDsS4jCNIxo8gOO0/Mcfxl+vGrknJv4QNGQe+fFDyamGi4mxxLTVN7b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOhqLDTL; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOhqLDTL"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c1ecff2b1fso452768137.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Oct 2026 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791365649; x=1791970449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
        b=aOhqLDTLgqR8NudH8F1o1jGt6FpxjHG0K5PF0Oix5YBiqeBjFx9ewd0nj9d4Fh7GXj
         sB8cGQGOZfDhna6qdLnY8vHNYm5K5b87AoqlF0Ews/TcA9podFGgxd74Ldb5kUKmz/DW
         XmDregUxkAaLloSjSU8zlZzjDumXb8aXlIGAwPwp47IrzIy5amFICa7QslsF1pCSxiPM
         nsxV04JZlRTWo4Qw56M/Fvy/7nhfJpQka8JKoBCsksMdUUX8j8S8ERaaR6HT38Qac2yy
         amfQuCFtA6dZXO70PIxdLOJer7S8WlSG4jom/AvrSUy8mLoApjuhijmInpbESuFmWuFH
         8x9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365649; x=1791970449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DEQoUozW/Cs8HCbMPzg7ZPhOKB0dfvcgpHAGzkIkN5g=;
        b=0IXzQWhjfITbJBsUAz8v68og2cKrrRjzGWSwzEpYCqAhQOzuzrpQQS+/b4PiyDLdhX
         eRlS1y/SA6i9DXZKJtYMIyNOprZ2iZ/SLKr8xnNIqc6bKKvf2Vv3N4bI8waMwSX8Uzx0
         vljuTAEVwuIAR4ZYvnzO7sBR5omJbcSdUHhcp+apL6xF2K7UM0LOVoHMBdH1Rfpqwtmb
         l5TUWqf+YRJg5MVmAFvxZbeWF0JRsZBNwNptfJiXl3XMsrXdWmEe6/p9mbrkF1XrUFHO
         IiO/Sh7NdROda3zTzONUDygpBjEsO7ncl/Kox+qJH2x5nw8gHvf1w/IXOcxBrKiYgRCA
         NVUw==
X-Forwarded-Encrypted: i=1; AKwUvBzD+gpKT/4ivjv1NmHIV13n9Dl7leb6qV4p1S2KwJNlHQHhrQB8n9kCmOvSjXlrbRHLuPCLx7AHw1GHBw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIhhjC9hbsQ+QUKhhmFx0Siwe9bpfUg99JHEbCo6SALj85xxSjS
	mfHfkmxkU0+7Fgpwm6hxmQcIPj8VogRPBIhu5+WSp+78/Tgjf/ByUL9L
X-Gm-Gg: AYBFou0JpJ1IZzU1Eee1DT0Rjaq2Kb9NaQFW6DkOTOA9vh0eCMd8jL40Wh5JRekOQlD
	Y0HqSR5f5AZfPpRNmv5jAWZjP4zToYZa53Kc+Peenf7GICt1Gl4aPNao5MadZbS3wFvZivAwuN2
	z4jQMvmXH4KLcCuQAM7f+cv4QPYQLB8u7hbQ0YzMmEeN9EqrV8qZ2SMeyHTGzQIx36mx/XWO2Vz
	mi0+cjKBeCUwJIPqPIM64lxDZYhEEuLhgBOC3DbTa0y5CAbHyA5Xqa5e1xI9rMzlfMZVMyAuRPw
	rPlDJVq2AAJX49kMcvCM2nX3I/o9B+WvAPJbsL1XP+fLgHGzoyTpjrbk0QrsaNedumJ0A16xqs7
	QNDDx56H/7BzRZSX25/ikMXpDBiCnsxE2r4udT0BJm2jY3Aew5ebXnPVEralxIQuugwmijk48dP
	Ohr/ry8utUoWzcHgdxk7bb/DKGdy9ZxGp5GbZZSyaxQ75Rd5cRrGWhn3Ja8I25c30VeB0gYG2pn
	py9ShOiH7S1AffyzotHyNaWttbI9vd0he3Uo9+ZPXKjbRzjQxXIm6f2y4RkIVsmSwzVaQ80JP3I
	OZbLutc=
X-Received: by 2002:a05:6102:2909:b0:7bd:732e:c615 with SMTP id ada2fe7eead31-7ca38e16ffamr456522137.26.1791365649209;
        Wed, 07 Oct 2026 02:34:09 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ca218138c6sm1319958137.12.2026.10.07.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:34:08 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH 3/3] serial: 8250_dw: Add Allwinner A733 UART
Date: Wed,  7 Oct 2026 06:33:23 -0300
Message-ID: <20261007093323.22104-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006193046.540252-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com> <603b4f40-2a60-4bc5-8b98-ada7a52fead9@arm.com> <20261006193046.540252-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

Correction to my last mail: the v2 change I proposed there is wrong.

Gating only when clk_round_rate() differs from the current rate is
e5d6bd25f93d ("serial: 8250_dw: Do not reclock if already at correct
rate"). 7dfae6cbadc1 reverted it because it broke the dw UARTs on Bay
Trail and Cherry Trail. Mine compares against clk_get_rate() instead of
p->uartclk. Peter suggested that variant in the revert thread, and Hans
pointed out it's the same check, since uartclk comes from clk_get_rate()
at probe.

From my reading of clk.c, the flag you mentioned seems to explain the
regression. The LPSS "-update" gate is registered with
CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE in drivers/acpi/x86/lpss.c.
Preparing it rate-protects the gate and its divider parent, and while
they're protected clk_round_rate() returns the current rate. So the
check always says there's nothing to do. The divider never gets
reprogrammed. Hans's debug log in
<20240317214123.34482-1-hdegoede@redhat.com> has a request for 1843200
rounded to 153600, the rate already set. I can't test LPSS.

So on LPSS the CCF does ask for the gate, and the disable/enable in
dw8250_set_termios() is how the driver gets clk_set_rate() past it.

For v2 I'm inclined to keep SKIP_SET_RATE for the A733, like JH7100
(b0ad20a3b64b) and SG2044 (cad4dda82c7e). The A733 bus-uart gates carry
no rate flags, so the rate calls there are no-ops. Calling
clk_set_rate() with the clock running and gating only on -EBUSY might
work for everyone, but it needs BYT/CHT testing I can't do.

This is separate from DLF. v2 still uses your 2^n - 1 check for that,
with no A733 quirk.

Thanks,
Vinicius
