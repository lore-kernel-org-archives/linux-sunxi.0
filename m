Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452875;
	b=0xlVK7eq1VXmIbeqyXSD7l8fjhfrqRVatjfPqZ3nClOrhsGlna31flGcKFLXLrl9vhwl
	 PlhBTOSpFsGuzGUnQr1Y5aMX5i94Sg28582XZNV9Fm7yNrlHJQ8YAamp6ANUMY+3oNy81
	 J9XbtJ9VYi2x4vXdKhMsXEmo65hLxqC0+dSQVFj/Mmy0OFtTzq2wRON25ZeDB/4l4mWF9
	 l6meq2JQMfL0spWlifQ60KwiGaPu1S9tBd9BfvIHjEK2BuFY8UbQg73ohXQDk++teyTga
	 Esu6XLyBLnvry5J80xXYikQ7rYkiR7664lUUDy+mGrmvsEMJ3BsVHxIz5BpArse50ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
	b=2C31CWw2xhmmfO7XhWBDIXJADQ9nVMOSLnzF0cVC90fTjp1RumYqBQANixTQ7GMSV4BW
	 Sgk8Yv+bI2//v8h6reuDvk8J2ocZBiSQ1wpTljFQLVgwxwakKP54dAV6dNyVkFtxxJz3Z
	 Q0BBJ0KDvQ09RNGAIyn8OTl1BxHYPtfDgnHa2YEukcZ2Jx9vXHrlVXB49EBFuvrd0rg6k
	 AzlvoSWieBlSjgYDhCJ5lG0ydawr52qY/dzU+09QB3ijxL1ul86p+VVK+HJg1rQ8iD1no
	 OFLkq/0Le3djUXz5wrpcBH+UpSFziZ0VccANN6l3N7qRMYOQUAzg+IvhxAYG8dBLpgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkiBXQXV;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9F9606A31F
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 16:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C9F9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkiBXQXV
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99e0082c434so787252241.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452873; x=1796057673; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
        b=nkiBXQXV58Gi7XZ+rkwmgzlKTAYEJdtRYLDVua+Ms3oO3sRQKoLxjYVTvV14LfafHu
         rUUgw+C90BiTMzBGvSSJq+LmyGar7gZGye2yLLNeGbhIw3/Nu7ZHDvwB2PLq/VIG0lVz
         slos1K7HYrj6zw69ZGVF25y9ANhsgap/Ofsmea1HLS1iW7Isyj4TExrmXErFlMs0e5j1
         GTIx1hWsVRsp8rm3/PbctGFHtaDwX/wtRb3oStXbEnHH80OU3727k2RNm3bXEjszxgld
         3M5eXst8/Ic4+K20DIV6/BMHXRf1zVjzgtIXfBYMW0SzD4n6iNwyGLErsqrEiEPM/Zju
         lbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452873; x=1796057673;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
        b=boCVMQgqI/FragF2SdA4oJqCd9q2fS9JNoaeOjQ2j9Q/DwhF0pyl8328+V0mHTao2r
         JLStYf2CVL0G3JLw8FsZJRSCbMItSS8fPiYv6syo2G+im/Zd63QsKVw2coC6koiSl8Yb
         cs170FOnI2S+Q7vtEf8j2WxZLDYGZtxdiIRzZqFkigg4BfL9eOUXqeDrtaq61gq9M8dm
         iqASH/jhfjp3GVT56mysMYj6Az7yuvU1Z7STApCLx4MzyOjK65som7DTC+dq+0wro7W/
         6eHF70lxEXTUtcagPQ3mWYeAK1BNkvNS7KWY6H1f8ZFjdGv2xBNij2IlRoH1YOfoJSEC
         7ngw==
X-Forwarded-Encrypted: i=1; AL+hErEN9waEsuGDuXzgPnTFKcbWjKRX5H+NR+Vpu5ws/EaXxUIcza/f3HeK4fFvOhY7ytBbir36mO5yy5fgbA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+rZRlU7NXPIVmdG0Ojb2ELaKmuAtnhKtg6tgHAA/LsaTOImMT8
	D96FAp0plSZBdAgxw3683lx9t/EapCOOmX49zCcediERt9PS+hvEyDkL
X-Gm-Gg: AZFdTZe8x3L2qJwDJg4xArhvuanu9L34M3mnDwl6cIrD94Skjmp0UcfqParX4f2hEoH
	wIP02bMhWYkyOoUu706es2WBjPUzDyPN9NDpowo8X7zoV12BSIJhwWCE58ReGZCzenPeJS/UoHi
	1S3nyZEE4gyUwHYWvy2bH5YNOHhJ+NPJjJkApWg09wbKIHWWUJFIbg0dFZOt5nV1Y5u7JpmeO8E
	XlFPqDYTuEI4JMZqqCFLgFcbIq1l93wwZcsPcQ0LD5koXKNgIlSzGYcMWahL3Bs/l/aG5tJKDo8
	zDIP2Ena8ANb14jAcnBd1ay7JqSopAG3TrTwRMVGh/RBsYarBdlkXa8LCWvHn3EpNAVEZnAd7kh
	vFkaNpwYuQGtA9BJL4GEH/lVh5yJ8so94z0RWqvFBmBFm5AetDKKrO/D0bnaTcW3aF/VdlYOi4k
	1Lg5lCND8YLnTioTJcNCFLwl9ieMReFGH5SUH5OQZzG4Y7aUW9cp5enwULa+YYXukBESIG8M9nc
	6jGKvxCD6uiEWTF8diCszO5C04Fai172N7OpdJJgn+GIUeKbjeDrXVCPkLXJZZZ4HWRxD54RTtf
	QCnFKQhONOtbGsMgXOszct4CigapBiluNaWpE5ZuvfZoFdiDKneDlGXqKGwacZvL3xHypvR3uJ0
	EnbCKSVvqY1pdBPpyMTb8ZQNCUTsKWv6p8/uh
X-Received: by 2002:a05:6122:488e:b0:5ea:c120:4514 with SMTP id 71dfb90a1353d-5ee8af3457cmr6237914e0c.15.1795452873322;
        Mon, 23 Nov 2026 08:54:33 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa42:30d0:88c6:e1ab:a806:9c3d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5a8fd3sm11386824e0c.8.2026.11.23.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:54:32 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Mon, 23 Nov 2026 13:54:15 -0300
Message-ID: <20261123165415.69710-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com> <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com> <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
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

On Mon, Nov 23, 2026 at 1:11 PM Andre Przywara <andre.przywara@arm.com> wrote:
> I wonder if this works anyway with using both the internal pull-down and
> potentially external pull-up resistors? As one would win over the other?
> Can you try how your board behaves with:
>          cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;

Tried it on my v1.11 and it doesn't work: card removal is detected, but
reinsertion isn't. PF6 stays low with the card in, in every attempt (two
DTBs), although it read high at boot with the card already in.

Neither one wins cleanly. The A733 datasheet gives PF6 a 15k typical
internal pull (9k to 21k), so with R59 (10k) the pull-down leaves it at
roughly 1.6 to 2.2 V, below the VIH minimum of 0.7*VCC (2.3 V). That's
my math, I didn't measure it.

I then tried GPIO_PULL_UP and GPIO_PULL_DISABLE. Both work: three
complete hotplug cycles each, plus booting without a card and inserting
it later. With no flag it also works, but only because U-Boot sets the
pull-up (sunxi_mmc.c requests the CD GPIO with GPIOD_PULL_UP in the
2026.01-rc1 tree I use). To check that Linux applies the flag itself, I
forced the pull register to pull-down in U-Boot before booti, and Linux
wrote pull-up back.

Could you try PULL_UP and PULL_DISABLE on your v1.10, card in and out?
"grep 'pin 166' /sys/kernel/debug/pinctrl/*/pinconf-pins" shows the bias
Linux applied. If PULL_UP works there too, one DT can carry it. If not,
I'd add a small v1.10 .dts that includes the v1.11 one.

Thanks,
Vinicius
