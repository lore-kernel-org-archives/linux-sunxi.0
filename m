Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675759;
	b=snTrQbaLNZAVHdXd/95jvYvzr3lUYwtSupXbRr22RURnL+ODCnLs9Egdx8RzVPTBpqLD
	 y5fCkWoHro9SebLS76nOaQb/8MIcz01xDpWWOKcc8XyjCASAPLz2wwP36yfG8mrn+J3aP
	 LXlK5c2zVNd2lMAcSECaIHd7pMqafJGgtMWEtmrLcHSznMNk5sWgOOhZGcD3ZqaycipUG
	 DxWpSGGVmUPUcWqkMkNs27M76SFhGJNtipISdoC50yDiTZwRSyOx6fo9MFxe0ndIWogH3
	 MbZu4jHhjA428LUh91I8tGaCRqDIUuVmow/nazMcMg2bR+jcoR2nawaElFjjfDdFS4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675759;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ALDZI9zzoGK/EGXlQh9cjJVsMiJ6Nq8NocmOtDE4lVY=;
	b=fKQXpUwYfZ8zh4jAK+2kPPhxOPxdBOVlsgGWo3z6CwcEtziuYNyuPm19q2SfE4SW8aZV
	 UuY3rqiTwRNLJpkAM7uZ9cwCOb3dmwPxmg6aNYCLZ8CJbvdqeOFTKXJYpw8dtvLERZN5I
	 M0VeqvFi15v+mPbdRFWiryXosQjSElfQ/kOwzeljaK1U3yZMcGsO1tTb/HiYC07sPzEeh
	 gfV6qug1gff0QIEBbDHOchAYKY1PLQtNIiK/VZxCt+qTuDXQqhe4ZAD9QSekIusr7GLDb
	 vmbKXWhrGOu+wIp6/H+KNdY7yKFOzrWqChEJur4iLdABCvss5yl4JXqYI7Bs5Mtd+bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TABOzGOx;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA7F606A32C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 06:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA7F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TABOzGOx
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2FEC3403EF;
	Thu, 26 Nov 2026 17:49:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795675749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALDZI9zzoGK/EGXlQh9cjJVsMiJ6Nq8NocmOtDE4lVY=;
	b=TABOzGOxi1J6AGOAfDZT/+WS29Uy6C2yZftVVmKrm7PTlSkOHLK5XDikYwiChl5+NtFTB0
	mt0gXWk/t4zEQNHNWaVInTVHmJl3QW1DO9vFAGNlYe+OHLoSt5CnH6DUmOapf4kZwqZN32
	OQ7A5rQ7qg9cdrnDajTtt2U8pF9kFby03TKdzdcVeFZdkIGrYOEkfqGyoBtk/EBsijjNbH
	3GKgc8UFZntRHQ6DXwfGwE+kuJD5mUzP+eMacK91Unn975VSCFCkKCse2QzBC7lQLIOxEk
	LcwirsXbizh3PCuS5ug6Cw3hTcqfnf1a2GYvF5pXoA7XFfKRRGVoxZc93wMlNA==
X-GPT-Reason: This is a legitimate personal/technical correspondence
	regarding a Linux kernel patch or hardware driver update. The
	message is sent from a known personal domain (alastair@d-silva.org)
	to a recipient in a technical context, and the content specifically
	discusses hardware clock frequencies (26 MHz crystal, OrangePi
	4 Pro, DTS files) which aligns perfectly with the subject line.
	There are no phishing indicators, no unsolicited marketing, and
	no suspicious links; the conversation is a standard developer follow-up.
From: Alastair D'Silva <alastair@d-silva.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Thu, 26 Nov 2026 17:48:50 +1100
Message-ID: <20261126064909.2584729-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech> <20261125122452.3966873-1-alastair@d-silva.org>
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

Hi Junhui,

Good catch — I confirmed the OrangePi 4 Pro has a 26 MHz crystal on
board, and my DTS had declared 24 MHz for hosc.

Updating &hosc to 26000000 Hz fixes the rate calculation:

  2500000.serial: ttyS0 MMIO32:0x0000000002500000 (irq = 414, base_baud = 1500000) is a 16550A

ttyS0 now boots cleanly to shell with your v7 CCU series. Sorry for the
noise, and I'll send a v2 of my OrangePi 4 Pro DTS series with 26 MHz.

Thanks,
Alastair
