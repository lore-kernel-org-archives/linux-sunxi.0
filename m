Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E049E129
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Oct 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791315074; cv=none; b=TxnYYlEmEPIa+hsLPSuUFZkFxZH0Frsadkn67bIfDbAFcQB+5zGXuwXJgcznSysx2/U9RrlWHi52ynB/A5grUclN6pdIhsWN1qzOaOI3wtjObVWFR2ReBe6i8g1kK5ZDSto+p2mKWFKF54Q/OzuVdDx5izFWgaXYi7K3RTGQcHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791315074; c=relaxed/simple;
	bh=ObcFZUo9XljskIGbuLmwpSTyteIwyyt3iWGxb6XgNn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqE/FoUBuPLAzGp5G4Dl24gUKWlsT4qMJxGBI4SToDEf47RsZrSOvyWneSwfpsVU6Rj4wTpVrTxRVMRWyOg6NRvJhZUTRHI39nKeViTGoZSgVyMqPKxt3Qeui5UnCsHrvjRPguu4F5sjeJqNyOfq6kRWsJXA0WDrbNzSbusWC54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThXnXzgU; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThXnXzgU"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35154cb9de2so966919eec.1
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Oct 2026 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791315072; x=1791919872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObcFZUo9XljskIGbuLmwpSTyteIwyyt3iWGxb6XgNn0=;
        b=ThXnXzgU65wXbgiweVZxhvKcleUJfIu5/LDEaAiRKlP0xkg70Dv9trvht30/xQT/Hm
         2PxkPs1EuT/phgrF3ZOrCjXhimGZhCgTtzfwYWCA1XJ2PVAYHOMpW6mz2MYsJxCj/rSY
         dPu57StrDuPEMIgOArU1WrqILFJSic0XIj1jvilTG4bwHK/lveYWsCG27NzbM38Z4inp
         ec0gMFM/uReAtx2BUt8nsByLPSw8lcauZ+lo5RG+Rw6FzszPEzkHNm6vwdzE58k/Bccp
         Q7nUdwEkc+w44DNXfXw3m0IfeK1EEYy1swucuTjC0UKgL8BuFUyJL+RnE97deKjqBFtG
         5eGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791315072; x=1791919872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObcFZUo9XljskIGbuLmwpSTyteIwyyt3iWGxb6XgNn0=;
        b=LNynz7mwVOw5ovRV6AqCQUzSXF9uTilY3wocTU310Ogp8+poQiA+q6wQlmZxwTuH8y
         V6UeK7wPf8Rb07VqmQEunHhsvI7XEdSEUiA/JzbexZ7ehjcGDjT2M/6vE+FaqOx70+nz
         qHAvaxvvV0y2j2wQrARpuAdz2AWzE1WTq6YYyeT4J4oGqYhIDT7RRVxj+x68f1XCMymo
         l2EdPlTkBq3curTFUtKoggGBVmOBNFaTAPqrGjpIZRaSPXz8+ge3/f0ntCY3k+Ohwlmt
         OE8px8AJ6mtyOO7w5w4cOwpgKvQ9jw22ThVVucevSIaMBlnWtnpxbfiUiPTHeDn31xYw
         O/YA==
X-Forwarded-Encrypted: i=1; AKwUvBwxQqB2U0ArD6PPlw0kyBpBkmruKDNkZPkNN8S3f/5nWTKK3rFfqPPDSUTSoRGabtg4ZIVnrff69uTDsw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLZ6f2IJjnqwLQLHGSJxRJDShstyQr2xdPIEqfZG23WuC9m2lIJ
	F0KMnjnnUQT8koK5IcARY4cepx+MbgpE44/8rCmhg/ObtnkVZPHR/dk7
X-Gm-Gg: AYBFou0V7IisWN2984AqW5QCai5/mfxSv5tmjCDx6CzTNfnU7Aqq3iERm246mtDjcoO
	7jkhg1nCPzBftvlwjCmeRirJmGSfxC5Q9/YSMgDrnIjj61UIPC3GHJZFuH6T6wXgfrsZi4W0zfC
	e+q2vWgLO3tcRaZL/wRlkOi/0krwnX1nkLaX6ktfm8qStUMozS3jZra4UpamqnPJvE3+1pwKdRG
	qqhRzXjohDIUvsYuu2f7nA93xdv9/lCxVsHL0cFwytFRlvqLdFY5FMXwDciKrn+2O7M0DCW3Waz
	2wv8u6O6H0kf4KTJsDUIISHWpRH8Jto0bOXEHekgrQP+8K+4g0x2N5mlSLncn1a41BMQGQ/Rd5D
	shnF50Kvo3KBtDbwO6PAZZhVpzcAHLOyJEgy/Q82eOEs1z7hXnUr7gJAkUbih/DrBEkB6Xdb2/3
	XFbMvas01VX6/Z1rqH8tyJtO2JV4Zg+9XydPviea/lV6kDdfaFlYlvSm3sYcQEknwx0WbaIA15n
	D3JcGI3EU3uuP0uSWrQydbGouRE5NQ511NDEi310XHfn6Vj/c8SU5G53b6pJ0OSgheYSB/0ZCXj
	e2Uz3gw=
X-Received: by 2002:a05:7301:fc0b:b0:351:5665:e451 with SMTP id 5a478bee46e88-3515665e804mr975434eec.38.1791315072116;
        Tue, 06 Oct 2026 12:31:12 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af170c5sm717764eec.11.2026.10.06.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 12:31:11 -0700 (PDT)
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
Date: Tue,  6 Oct 2026 16:30:46 -0300
Message-ID: <20261006193046.540252-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <603b4f40-2a60-4bc5-8b98-ada7a52fead9@arm.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com> <603b4f40-2a60-4bc5-8b98-ada7a52fead9@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

On 10/6/26 14:16, Andre Przywara wrote:
> So isn't that a bug somewhere else then? Why would it gate the clock to
> set the rate?

I think the bug is in dw8250_set_termios(). The gate comes from
4e26b134bd17 (2014, replacing the Baytrail hook) and runs on every
termios change that reaches the driver, with nothing draining the port
first. On LPSS the UART's clock ends in a gate on bit 31, the divider
update bit, so I'd guess the disable/enable pair is how a new rate gets
latched there. On the A733 the DT hands over only the bus gate, so that
is what gets pulsed.

> And what is your use case here, exactly? Do you reconfigure the baud
> rate while characters are incoming?

No baud change. I toggled only CLOCAL with TCSANOW, 300 times while the
console printed 3000 lines. With the gate alone every run lost 12 to 18
lines (3 runs). With round_rate and set_rate but no gate, all 3 were
clean. A CSTOPB toggle splits the same way over 6 runs each.

> So can you just expose CLK_APB1 as the baud rate clock in the DT?

On the A733 the UARTs aren't on APB1. They sit on APB_UART (0x538),
shared by the seven UARTs. I tried it as baudclk with the bus gate as
apb_pclk and the console was garbage. The driver asks for 16 x baud and
the CCU rounds down, so 115200 gets RC16M/9 = 1777778 and divisor 1
gives 111111 baud. 24M/13 is just above the target, so it isn't picked.
ccu-sun6i-rtc lists RC16M at 30% accuracy anyway.

It's also shared: 01569a29af76 removed the clock notifier in 7.2, so a
port that re-rates APB_UART would leave the other six with stale
divisors.

For v2 I'd drop SKIP_SET_RATE for the A733 and only gate and set the
rate when clk_round_rate() differs from clk_get_rate(). By my reading
the branch is never taken here, and that kernel was clean in all 13
runs. H6, H616 and A523 pass only a bus gate too, so they likely see the
same thing, but I can't test them.

Would you rather drop the gate altogether? I kept it because I can't
test LPSS.

Thanks,
Vinicius
