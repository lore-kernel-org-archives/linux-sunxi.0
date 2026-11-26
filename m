Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725242;
	b=T2+1n7RrLkXyFeNJtPzLQi80ArfhHerQbIyYo4iREO0dbY4s1xc9cbM+BemJ//BEgFYW
	 UN938+xqvu3SdlSKiklFDZft/ONUlZ0kr+kzxAwJvONsRJha42zpsc9XyIJ6nFp6X5DOE
	 0pn85PXIwYtSUD3yw+CwjhZcYUOdnlQ9Ow2IW9T1MqEvblsPHtnZisRpibSc407BFH8F0
	 /ufhpjsLj/yh0xUxOHAFPtkBzYXnvRVqeqJ0u5DbkTdjmlgwmji4DCHdj2Qn5hOKVa4kY
	 QvVzw0pt7M6UgJWbUQLQB1wCVvEHXYttdHKfyZcjlmiVYuI6FzezTxoXSCX0Qwlmn5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
	b=TqTOmbrNQQ/3RRLbvIGhhaWlPflY39jf+LmfXuKZRgGaDbXjuqmXbFDfItF6jy5A80P5
	 yg1fFG7bvN+peRrLgg1OPUPbwsIUvnXATZoR7Iam3AY9zqUv3JAI5BTPurc5XxCD2jxI6
	 O/ssU+BHECjX2RncopatV0UEy32F9P90ZCq3P63V+vOFODry89nBnF0kZAAzkJw4eCIaS
	 yuwRVIBlXd0QwLbQ1Jso0Y2Geha1bSuJ/HUnHv98deNo5CO5PGWk8xTdhW9I6lR5uJOOb
	 znjLDDCud8OycdIzZo1bX+xkOFd4B6rgolwiFreh6BWdG4RG0UoCs7SWRqOaDLyt92A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RcuTK2K0;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E50606A326
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E50606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RcuTK2K0
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-847ac7ccd85so4171981a34.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725241; x=1796330041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
        b=RcuTK2K0ABY57PllZsKphdj9P/Iuw11Ccw6ycW7V1w5/9twuDRg6g4LL7g2SZf0dYg
         STQQ2KkJ6smwXUvzCPcDV1PGH2lC3RepK/lBAac8450YFIps7QyOs0j6pf+Rs0TkMrzX
         QfqqJRR41rWZjD1GUkEuMQdo1/9EHWuWCa9h0bO6LkP1weT4140cnjvxsBCdj3TQm4A8
         SHBmzoiHgjNdj9T3bFcHXdDaRQsjKgwSc0qzT0Qx8b0LIH/fSjW2KmHuUnzpPZhBqqlE
         0JVzAq9gY/MGbudqTM4AHvmo+BW+zXagu4EkhDG54laWWwOWZ+sTqjBVrMMRNnHoeHzr
         ZDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725241; x=1796330041;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbsvamPXVVsk6WUGKrA0iCW9sEFQvSqMVX1Sf+ynGWM=;
        b=04TQffLYxkDVVnK5MMYV5TIbxLufHvGndquZCqzNZkAbS3ligOlLULJTBMqTKNnnJi
         oqygxRrZxIJPWdxUBSDh972BTZZ4vQj97ZMk5NR6eEPwvHEEgcLincOrtDLLbbl3Vvgk
         jAQJskWQOzzcUJdi0KkaALd7oKy/c+nL2H20QhBAMQpbULG+zOmL8GljhhF6GF+VG2uy
         SqwtQVL9qWUMmUihwrX700hSJvOD6T+fEuycQAs2mdkfQnzzjvutagE4Vm0UgvLCQfg8
         IB8Kw3PpCPm2VSbUsYW+aWutwiFqLrG2ALAN+2kQ5YWloqIFnSDOk4/K1WbEyc2yoATW
         EIFg==
X-Forwarded-Encrypted: i=1; AL+hErGVgQoeBBdEl9RyAH8wF9nC4eJNe194LENM/mtSsxndInEkzh6RzE2DOeds6Z4v8FHJjqJJr2xQOYS+mw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9NgWbLeeZ7/Tj3PPIjffrcgGqJqu+ytMEExBEH1i0CLP3LM2/y
	En2Zx7rZbiThxSm31TihUFlylpTE15iF/UJuYrDSFdOE4uqFTWbNMMdZ
X-Gm-Gg: AZFdTZfg9BHm3zYK21bRxgboYrSxiUxjf5ZT0bqtOXqYjbmpj1ArQMoaGkmkxStcs64
	qaLmOWb89WoRLCgnnPLlL/mpP3xFNLpgHS79fNjy3T58TVYFk5/VvdOI+irWSVEMR+VefhffAIk
	x6Us6tW/j4iKZtRhhlsgYHypCrSYxdU0krUsLQSYIyvaFA9BuuwxL1Tkev5wz1xUCX5snRnn/IF
	4+RGdjwUndDGMxF298Zu+6avcQhwXKxkQ47csOaSpydOmTcuh199tP+sgEZkK3o40qSNoDuAvTy
	byoAD9cp0URP4rGMLz5A2EBgytOVoXRQxQ1jxxJBy1s38oyUt0cn5hT6tA/i7MBFWmw5/Ts4wfT
	yfP+3COY33d5sv6dfjXvj7Es+MVtVHtT+hwzDhh/ZrKbrvZGvo0qzK7y3cfxMDcZfRxzT4ROrHQ
	Sy0nzKwKvYxyUXo2tcCXY4V0Kv4L9q4yds+jZelda5G5aOo8FJNlEpHsHCTt2v9gWqJXcdl7vVe
	F2Er82YWzgZbuzH9D8BxERUmfYAnr7MSEDm9oMNEQ5R1gfpE132qacnxIrHx0lmT2sIgV7Do3w0
	98nF/EBQp3VR57i7u6NKZzlzffKSH655VwXW6QcPCujlII6c/qn1sm/+xMJ53oW1zyWTatmwgbf
	g+X2xJfA=
X-Received: by 2002:a05:6830:438f:b0:862:aa2b:eae4 with SMTP id 46e09a7af769-863159e9bd9mr23567439a34.24.1795725241022;
        Thu, 26 Nov 2026 12:34:01 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692f049sm16133926a34.25.2026.11.26.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:34:00 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: wens@kernel.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 26 Nov 2026 15:33:58 -0500
Message-ID: <20261125-a733-03-board@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-3@gmail.com> <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> "PS" is a separate output from the PMIC's "PS" pins. It is fed from
> the "DCIN" pins and has some internal resistance and a zener diode (if
> the block diagram is to be believed) for some poor regulation. In
> practice I would expect at least a little bit of voltage drop here.

Sheet 4 shows VCC5V0_SYS feeding DCIN. PS feeds the buck inputs and
UP11. I've described the two nets separately and used LDO2V5-INPUT for
the downstream rail. I've also renamed the oscillator, reordered the
regulators and removed cap-sdio-irq and the blank lines before status.

> > +       cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> Please actually test this.

On a Cubie A7S with the posted v5 DTB and Vinicius's EINT-mux fix,
MMC0 reported four-bit SD high-speed at 50 MHz and 3.3 V. One read of
the first 16 MiB matched the vendor kernel's SHA-256. The mismatch on
the earlier 4 MiB read at offset 16 MiB is still unexplained. The
EINT-mux fix is now in pinctrl fixes as a256b8c8083e [1].

On his A7S with v5, Norman verified that PF6 reports the card present,
MMC write/readback matches, EEPROM reads work, both LEDs switch visibly,
and warm reboot and power-off work [3]. The v6 cover lists A7S card
hotplug, EEPROM writes and write protection, and 1.8 V SD signalling as
untested. The v6 DTBs have yet to run on hardware.

> > +                       reg_dcdc9: dcdc9 {
> Missing voltage range.

DCDC9 reads back 1.240 V on A7S. Vinicius cites a 1.2 V ELDOIN minimum
from the AXP318W datasheet draft [2]. I've used 1.240 V for both bounds.

> > +                       reg_eldo1: eldo1 {
> Missing voltage range.

For ELDO1, schematic sheets 4-5 label LPDDR5 VDD2L as 0.9 V. The
regulator reports 1.075 V after firmware DRAM training on the A7S.
Do you have a validated VDD2L range for this memory, or would you
prefer to preserve the firmware setting until the range is confirmed?

I'll wait for the AXP318W series before asking you to take the board.

[1] https://lore.kernel.org/r/CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com
[2] https://lore.kernel.org/r/nh-1384c024-38de-4962-9d4f-a0bfb55471a6@google.com
[3] https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me

Thanks,
Enzo
