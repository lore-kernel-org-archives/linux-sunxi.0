Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C48348C6C
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013102; cv=none; b=nYwWO0nvYB5H5YNDpTdTQ9YpPtBs4azt1JClv2Gp22AcPp8stI3thX51fVtum15aJNjapIgY1un2QKCu3hpW1oS8aEoCXCtLaeOnzxE6vTabWxHfWqEhcwSQz7FFzh8KzI5Keuq80XwapbvYXfHFWWp8Bz4JqO0/5PKObeHhK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013102; c=relaxed/simple;
	bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxswabM22MqsGEhedzMRUSSDx/daQB6RnqyYwtnAPHA5mYI5pqvwAi1AsB8q7Qpja4EAElp1Y1Qo2PkwzfZK2twQs+ifbQnZLrAQ9YO1xxejAh0TXOoZKmmMdVdlRknDv7Yz6SNYGr9h5kQmaGNDVSlvjRIOVVgwdX2Wz3IjvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPaMmeW3; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPaMmeW3"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ee88fce572so22253886d6.1
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013101; x=1783617901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
        b=IPaMmeW3YfzzH9MIBjECwXjVq23SZUZXqlVtwMf+APqvSowt2zefxT8AC9lKzPVvEj
         FM5OKMvRd967/813DdvlUpOLHH7S3Rnfbk2YqfR4c2+++tiHBXKHs0VRl3XxgbfzTCQS
         j+KZXcBmPgvhjJ475C0I8UiSxOVdBB2q/VgYStgTTYwdRcDfQCgPTU66j6fn/h2qe6u4
         OMaP9MPs6lK51tdaA824e9QcCTaWw51FL/SwOkUWwhxSBqryb7bHn1ckLVsHO4rSaruM
         y126qI2nlxzdD6jATZSQWmog4rXKAk4f2EPjk/QPlLyFz0/x8H7QRRQwOCN3KzCHtkv4
         FDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013101; x=1783617901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
        b=KXFu+RQGzOkX90Ur++3IMLceQ89gPOP0HHiJuT4jO+tQxYIKyb3SA9GgQfHRIvgWKz
         +NuXXyeVCrHyTCaEN+yEEZydJV0y/5BgV41eg8YTKC+ANKUhi+oe2lYvo8eyFJiqeJUE
         Kx8Ul7Dnst/h8ka52t5zKqp/vDlMaXr2ATB65Ipi2ZSkTbzbOxp6IN2X3yaL+xkWFjJ9
         voCI1tQqMfmfck1Rb+7o5XLRcp8wL8b7dRSphBnW2VWiMzDtE1rzpC4XY/p14YBmLefy
         NxebLEtusZmjM7pn997FleNKAjlEvU8qGcO1yBK8bOauAAUSngNwgotO7yIrV2Pd+fR9
         QNmg==
X-Forwarded-Encrypted: i=1; AFNElJ/JnY00Ba3pMi8WhGMkeM+4Gzd0ZTQ3nxOqAgsIIjsTSLsqovmYGnNAKsmUHdg1yZenfOtesddwxZhB2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxK1ehZbhTGGgrSpsrQv5Jg/SsBIaaGKTTQaZc3ChUDnhW1JzKb
	+XREffFDNvO6v+ff0ZdIN+cAz0pMsNjCQANvS0IxfIteQ6jlvTwCY6j1
X-Gm-Gg: AfdE7clLGNH1DE45aWywOU7vciJGOZZ2U/HMBGmYF+EaRyj9Vwpx71YNAX7PQkduccG
	R7aUEGdUq5MzBt3MFTLEcIbIPr4L3yPt/PwTP700+wDrdvxHB/2S2y7p8xurT/lTozbHY/UpmmX
	xqrIixrVdzA3+7Sekz595Y6wCAWMxnAekra+BUfN7RbhwnGJJRI+DtfnXHt6a4EcH5HQT1MyWcW
	VaS80uY6eAOYZVOZPDe9xV4P/xo5G5S2F41BGZbB45wNntTYa4COSQ4SoIVKPWN69DHWoqEY++N
	DiOe+xhPR63Pn46iHBEqyZP47dJBf4lvjuDqc7Bkk0QAAThKgIHlGBC8cS66xcZSovVDx53hpEt
	CYGLZHX4G8IQuoevCYB+puihzpLCJodsYDNmtHDsG3ChPI44JX777kpOy3/ldrBbMHOfafgH0W3
	Gq4uquAxBi81qdvvhi6ND8WbmeCEKH1SeG7b7n/Ss6KvBI8PnV5BX4GxQhVzFiW2r7wH3t6bE=
X-Received: by 2002:a05:620a:4555:b0:92e:44be:bbd2 with SMTP id af79cd13be357-92e7afb2399mr780848785a.9.1783013100344;
        Thu, 02 Jul 2026 10:25:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801948a8sm265545285a.35.2026.07.02.10.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:24:59 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Thu,  2 Jul 2026 13:24:56 -0400
Message-ID: <20260702172456.848487-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-6-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-6-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Register check for the mod clocks in this patch against the public A733
User Manual V0.92: 88 of the 94 mod/mux clock entries match the manual's
register offsets, with the documented gating/mux/divider layout at each
offset. The six that have no register in the public manual are the set
already discussed in this thread for provenance notes - avs (0x0880),
spi4 (0x0F28), sgpio (0x1060), lpc (0x1080), gmac1-phy (0x1420) - plus
one more: tcon-lcd2 (0x1510); the manual only documents VO0_TCONLCD0
(0x1500) and VO0_TCONLCD1 (0x1508).

Thanks,
Enzo
