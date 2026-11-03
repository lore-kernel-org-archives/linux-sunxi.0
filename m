Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669603;
	b=QpuylFXrHokslg2dP3NuCf5FvzfnwkXHhiOgabc/pDpHKeOnX/ASLyOqrQrxa0LFBEi4
	 PZm8wu3CaNmwDmS8rzqh8IxeM2PKGTjng2PpROJFdXEemEXbuknvdecHIJqY1UhRbDuKc
	 pC3YEZZuZYqozrQwvwHVLHxsU55om0P5Yzdrb3spdWITE2KMwoD0s+sNupZ51O8OfUXlO
	 VA7VGD03gGEVU1+FI8i/b8nf1iXQXMoGK/AtHz0e71kEC1cgSUTzKBl86zbPY7T+grWBy
	 rZwnGAn0BqaFCHBya6qCaB42TjvD/4QDP8WYo+1r6GmxAlJ2gNsKbQEzmFwS8QX8vng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
	b=BGL8FVhbTXCcohTDyHlrvjQ8c/WuPtI3c31JljCY5Uu7T5b/cohY6LmAvfiDfF0M/opd
	 vMy6KV+1cmdMQSsy/tzGfWa7J9N4hL6aig60z7t6qrvqmshVPUswCA0cQY6IlD0T+izjF
	 l9yGiCS5d5euTP6Curb9Cdj4xzT9/g7YQdQFFkTjamleHdA+PGAutsTs8DPcYKbdT4TDJ
	 YH28Vb9etsIo75/kXi+1+TNALpm0V3ZCy49VsKBmDZnuPJRI436bK8bAJkyK2p+9WaTeb
	 zCfgwjGX47+0SqUiaeCeDwGjG6r4iCFqkQkI7yD14aF7L/BrO2zCRxF6zKRxwnxDnnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkrNOIa1;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5688B606A32C
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 01:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5688B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkrNOIa1
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533797e72e8so23271651cf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669602; x=1794274402; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=TkrNOIa1XurXxtRy9Gs0oA8OOgMWZ7jStn2nPlAXesKrJN37kAWYbf1xGqWLLe7Kz2
         JA5S77SlvdShWbBHhbsGy1lNDDINqsajke/KMf1fZvhZ1wmBYgkVq5R8PgKgnvjPyWMs
         b1IAY0uapL6Rv5kn0mAR6HBdgHtHlDzI/4XBnecu9qLtS3doJVlvuz15C+FJZB7HPQIC
         yg0BwJYjIsUapZjjgRO8xcmezawIKFnxTGv82mRpHvTwSQWxhoEBIoRqHui4aYis3wJw
         kU+sPDiUpKt94gcHgWhl5PnDeKKsPBQx4oVDDI5Kv0kAfNGmSQ+IlsAsLgr+Djjrt9rB
         vewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669602; x=1794274402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=gBtWnXP9E/jsCabKZfkoe9sIM7yqOcAstTKtAJ1ZUdpFm9QMSOLmcHaA+/nNzFMQNl
         KgwVByQk9b17iEIGsO30BGGmzuKD+iNDg7QcoSfnwpb5S0Yzy6cWDgezqO/TMzV9uZD0
         rqhp3jhu5mNTezuTmn2JioSoqoYO0NwXoPINlUnyhMt766kGvUVslPexB85O/Sp/PRXV
         uDKiwKnx8kzww3uGOLfOZ//4lVhaVJguVMZW6AmLSkbaNIIPtx9+EeSCz9oSMWc92SNL
         8/FlXKvkpoCHw3bziiLpYqSIQMR6rm3yaLkVaysph6zeQ4Q5RDLe9szW/tNyQj9uBvJu
         PMFw==
X-Forwarded-Encrypted: i=1; AKwUvBwRlj8g5ZVrNDfsdWk6TPS/zyUrcbI3WEfF6WvpNEXGxYgFW0Fyn8T12fW/XYl+t6Krb3L/HBWUwOzZhQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKEgnn24TVG7ul6tk/dohzd7ABcwFyJqq/XcpTFexV3XZkIHxxc
	Ee60+4gOogjpdQw8JBMT5mLofwG+76hDLJeN8Hs2Z1JxulFw+s6lfGb/
X-Gm-Gg: AYBFou2GQGvyCXHK0weT+DZUwIedLgqa0xb7JGhnL7pV+isIo9w2AaDlqeaSnBXHmyJ
	S7ecdMKR26fBxSO9oaZz5ruNcPTIhSQFDL4yd/Hi5OdsiGbHtzNnjKSDAyCPiyyEqKT2UzMcePi
	cwn+bTB8xBDVmGbrrH8UV4t3sDW1W47sEIm8MpmtjlaDrp1d3Mxte8IB4I5HfFE7clqNmrUlBOy
	g8qhCF9WZaL6IHHIBKGq3Cp2vvjzMR5IDny4cebHYiEOYhVx4kyOQchhV+DRHwHtVHgW+RTkoaK
	kXaqhZvy/zbOkmnccq5Ezb35eXZUf/eITIz4ftu2p9RsKXpiNBjW+dDVtuuzExTKi9PwHiA4rHe
	EarIQB9FVy5wMI2FON+WotVe2XK/IhyRwwADC0MbGIvNJ70dnHZRFXGqbBWk5xQ7JJA5nG8g3M2
	DIgSA+QiutqDvt9Io6pxm9/dDKkqLixVpQsZYUUoWxiUrlhc3POi1fFluSiT8d7eEqY6IrKu+Ex
	K/+DBZi1ZAMRBPgjok0xX2iUF15Qnj9fzduXmKLHDH10rdf1maAi0YvGILmYw5nVrUmiw2vDFeG
	FvTry7R61iaHCaMG9s60destefgeP9ceu7BYOVe2qin5r35SfbGifHoCcjiNtQXxda+jHy2/y3x
	7MJsIKZWjhpZrO7nkMvJHQ1R7FQ==
X-Received: by 2002:a05:622a:3c7:b0:535:5fa:ca6e with SMTP id d75a77b69052e-542b75236b4mr201626151cf.51.1793669602205;
        Mon, 02 Nov 2026 17:33:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb5b520sm12746021cf.26.2026.11.02.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:33:21 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  2 Nov 2026 20:33:19 -0500
Message-ID: <20261103-a733-ccu-v6-fw-clocks@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
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

On Fri, Oct 09, 2026 at 11:52:08PM +0800, Junhui Liu wrote:
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);

On a Cubie A7S with vendor boot firmware, v6 reaches a Linux shell but
stalls at warm reboot. The system-controller firmware uses the R-domain
timer and mailboxes without Linux clock consumers, so disabling these
clocks as unused can leave its services unavailable.

Could you consider marking r-timer0, bus-r-timer, bus-r-riscv and
bus-r-msgbox here, and bus-msgbox0 in 7/8, CLK_IS_CRITICAL in the next
revision? My standalone patch has the diff, firmware references and
board results:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

With those five flags, two RAM boots of my A7S integration completed
warm reboots without clk_ignore_unused, and all five clocks reported
enabled. That is one board on vendor firmware. Vinicius reported native
PSCI reboot working on an A7Z without local critical flags on
bus-r-riscv and bus-r-msgbox, with TF-A and U-Boot built from source, so
the boot chain may matter. I haven't tested suspend, or shown that each
of the five flags is needed on its own.

Thanks,
Enzo
