Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340243;
	b=o+oQK/rnHKIXSF/CPJCj3EKLsWoHpeWbbhxCeP4ZnxBOybEq0jXsW8l+RKHVfrEfZOF+
	 vO3P8WRb35/NtjcLviZ/QkWM9g/dJJdyK1enV6lZRv2XzMnBXAI5LM3P39duvS8vj85u5
	 JNrJ/WCj9JurgSjCl1qxQOdqL+bAVmWBztoc22h2wQ3s0SF3gsLO92jFlSjMk94AkQU+M
	 PMyZselfAp9O/Wr3vcvtQyh0Z0aZAZukaaN/qMXuVkCpCAYorTmjHbkh4yVR4LJlo4ry+
	 v4TfMSRhiHMqc0p+sNNOsazxgYTv9fLpfByPi0W0MHSIsgMxshu3DavxkCHuqiP7s5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
	b=SPd8DS+UppOakkZUDImFve/6XWpvH7N9ikhojAQ+ZiyvBhZwGTF2wRt2CGqkQINf4DVl
	 o5GxGnxcTzcRinlpzlStQQSIIkLQHV5U9ENhvHMxbfkhw5/Hq3u2NX85sPioczETCDzzN
	 FFyDIh0HhUTB5kqDv7E+/fUpUH7wQaLhLOdjUECWyC44qq0TXDNBogp7oXIvdJnyCkSDF
	 /F4Fy8k4nz1zkTbv/x9MGp5jhakxvLQ50+92AZkT4nXJlzEIQBuPli5BSbbEFUzR+L9qH
	 gusx9viqSm/KmcHtwg+MvaCl0GD+G2JbVwr7P3UxKwlukly+gPWVhkt46uuyr37ftUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWpZrvBp;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BAF606A330
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 09:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BAF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWpZrvBp
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b40a522c00so284754a91.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 01:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795340242; x=1795945042; darn=lists.linux.dev;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
        b=QWpZrvBpclSk8Y3djgHf+V1CY1agQnMb9AM7M/k0MXemNugZrqLpkQmkhHLIhr2DNl
         OP4h1r/abJkwKQIbtrPl8Z7HvQlVGrinrWjuD3VE9I2T7lF7HdElQhmLr9SBqNIyIm6Z
         eKTpvkZRyeVS65tI7wKc60EpMNbiezPxuKeMXBA70uE8omtvKIexQx9gmIVdN5dXEFeM
         u8Fj5guEFhVZ1JT86cUC1oaww5wFcDtGg1rKdeL+4x2gqlmJM1Eda/tzBnAL1Q68iJuI
         PKrwc1qyvkgB0EH2Q+ifTq9Q/45X+HkTdm8uxw5ZyV8OatE6Y8oJpk6i3o3Z8R0BfY9J
         2i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340242; x=1795945042;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
        b=eIEYCjF9HSF5Dx42iQ7D89A+DnYXITgU+ydtqtriy8+fXhvkoDRdc8xPPaWOZuMskZ
         +0li74PV4xBea4NIpJ1omnqU63DlbOm2cTHbpsNSM0UVCKe05s7URWrdLdDABKFGdAH4
         XdwtIHr+5CEuLvDQOOlUkVb8IWl4aQy+3AmzAToh+TpWgS3yt0hvCfYGuawTztBOz4Qm
         132hCsXl8pYnRKij5aUgVJ0XW2ldmbsO1LhsIX9VNm2hqCjl6DukMSCAjf/l2w5AY5PP
         5YAYRqMr2Xe5MdGsgG2o9jE1qbUBDeTTKIq8026XC5rPSXwSm2pIL6x822uId6yd0m2S
         STVw==
X-Forwarded-Encrypted: i=1; AL+hErH0EXDLOFKAk7sm/GpTEiLNBw5SHAnTubGhnZvq546PbDvkvpZ54zMPoFVvdsK9VbnHvTbPfGrOKbH2Ng==@lists.linux.dev
X-Gm-Message-State: APuU4Z83rImTw/tonE5ZqvJgm+8UX+gCEC+14iQ0qymM6QbvRj39APN7
	CtjxP62KHBJvx06GT4gVx/AQBQMrteutDvkBX4wIFw1TslQvTJ2JK9MC
X-Gm-Gg: AZFdTZd1vzrpcllLHN6B2241JxVWTUtifrWf/d71dzAFua1i6E+kG1v7jSoLFBiQrCg
	4pRfiG4p3x3WLOcXNXr3EY2s3nR8vurLpRpD6CVqBcnLAx94jH20KP6ITPtWi3y0cH5hsFuOUIV
	dTfWkpkfssx+R+WYMPZEV2bK2wPhRjxng/ArWl0Xut/xIXV4RGqZ/6Uf0lQ3ferVQTHevAORcRE
	3IhtV0GEfY43nxX/pHIMRG07UmfF225uSogBtrkulTT4xSbCf+5FanOumEBzhdb8u0OcuxX7xET
	XAa+vN9icHiD9ZkM6SyT4oRUVtvmvPNNnGAIOjf+beswBDT5ZypSr/LaUKwT6wQipPjcAKGB3r6
	qa3jPL6c8v3ujavDtc76vlsuFKN8oWY0VsNieCiOXANmuwmKyaEIU6yGIUEcUIA84U4+rBoVXBu
	XCt4yzMzMOQ/v7GlzuFLr1kYYObpI4rRb93isVKIcwDBTPDiwfxsdclCduxdnKk3OZusSx0i6PA
	BDw6x/7wOlDasl7KJYh2M8hWSTbdQLyRRWy2VEjbNqzoB0c/+k4hzydTM+NHzYDVra5uFTGptR/
	a7QvQBwOOZl1h/H59YtlwUFoNGlbkkI2TsIccfScLxFOeGDPckTOaDTb8rQhGpUWu82Kf9VBRE1
	PhtQvEgPNAtk6Ur+OYKBJH5czGGw=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b41c98a1f8mr12481111a91.6.1795340242152;
        Sun, 22 Nov 2026 01:37:22 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm3367272a12.12.2026.11.22.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:37:20 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/8] serial: 8250_dw: describe the Allwinner H616 and
 A523 UART configurations
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
Date: Sun, 22 Nov 2026 09:37:19 -0000
Message-ID: <179534023971.231108.3039673113639895699@gmail.com>

Tested patches 1-7 on an Orange Pi Zero2 (H616), backported to v7.3.3
with the two prerequisites; 8/8 not applied (no A523 here). The UART0
console at 115200 passed about 700 KB out and 350 KB in with matching
md5 sums and no frame, parity or overrun errors. UART0 and UART5 come
up as 16550A with a 256-byte FIFO, and rx_trig_bytes 1, 64, 128 and 254
set and read back.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
