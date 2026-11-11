Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398994;
	b=fRwtOwDnxKftznuduD/teLETryBfICaU+/GbWB1LNT/+y4TLdfH7994/wLZidxiR7Tkc
	 ZPLv7F2muB+KvwOnL19r3t7oOyAkRz0EZX/fa5KpVsMRMfH2tOq4VBKlzwHiAAssrQUIY
	 LI8CUo5Oko38t1VQmCwN0gl/WkYxU0w9IbNqH7H9DusTOGhY6xY/XBeo21ma2WO1/hH53
	 yK4uG7NR9NvezaO9d7uumKL459Xc2uMfS+qOFzVTqT/4+63t4I4/nGgLzVdGWi/kAwP/3
	 ZiikhkI+MeBBlFi+qhdUYwP6I7vf5FgxXjm66aVSpdDQjwbWmYuql5ET20lUULdqBzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
	b=WNa/I50023lv15izHr3tZERuxm5KIWeTVb7E+RUtFwaXttFh03ABeWJ3JD2n2mmxaFX4
	 mtOpDJk4BEX/GfG2Vo3IZIyzOGof03TcMU9CReAeiYzyB+EdD8ebITbLQKje3CEYk6uUO
	 XdfxMjIpFJTgp5TqziIMgNamo0+KXtb/BkAP0R/AuviB9M9v0XiL+dxY1MoyE7fWbt4q9
	 +ySoHFW2lvfC9UnH6I4UyTr0Wqx0so3bYzUnxYadgtMR0Bd/lskmadrROjHqF8+F95RSq
	 fGvCBXoygSqZu5ySSxFlzXN0Pt+QUdyLeITNs0XFnrFMP4hC7p8NLOUegJ1+Ymh+D0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSnmjNwy;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92D606A331
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 12:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A92D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSnmjNwy
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8470d7d430fso1614913a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398993; x=1795003793; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
        b=mSnmjNwyVdRGuQvrjmCQI1xRtBIWxx/uleOvgIfl29Sv/VQc8Mdk6tue1vXhp8xZZY
         fZIZs3CvpKadXc+BQX2ILmsiDjkLupC9mtTgSa1mDJWgYDs0xKUqDpJKpUmBpEm7Wnvn
         FcN4YzaQIX6A6fL3IRaf/a5u5RKOZDaqCoaNZZUrfp1/xmr9bjDD2Y4ONhyg2OVKuPCe
         s5ga5Ho6duOlOOB2csGfly2mIggnojEskzrW/FQ7nyLQbRGUaHc8dihkMA4/PI7S5Ron
         7VxudNOCC5u/KmXD8wu9zb9/flehYqiWMnNiv8duix2+w9ZlAyY8qILd1a5poXdaqka+
         xMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398993; x=1795003793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
        b=TOGqKJal/L9kTmVR43Ek+kPU4XpglzrBtDSX+XR/15hAFPyh+a/I2iSZ7ZAGb1BcNu
         GS7HJFXcvEV/q91EN4B/mWpO519XCgBCPpGs3A1MZW8whgFjOE96m81OOwYQElqkdYDb
         GieFo75QCci4NcTd1b8ZCA3z55A4FrY263QobmKNviOGVtZffflJNJ156+DmcPxIuLXd
         SS7YfayziJPJ2gQRSMOvORjN6yf1g+lF+KcaSBbEshukLo7T/RXDYWCjP3i8iow6tHk8
         HXmwrseKWuAhta6Eot5vRYJ7Sn3Nm9vPUCJKcGS/qSj0+WTwadNr3IFeUMsdJGELVBwZ
         MH9A==
X-Forwarded-Encrypted: i=1; AL+hErETtafaweoaIM9dn/+U05JMaJuATgLcjC03Epmuq1eYA26o996ZUBAaW82nVft7zpL0wuf9Pqx44blLxA==@lists.linux.dev
X-Gm-Message-State: APuU4Z946T9xi3M1y2KOebTFuRjTkW8Jzdai6DBKbR5wD/vmyARRzndX
	ZiscbejSkSRwgr1zOl5gI8/tcF/fa5MfZ6TOlt7YwM0cI9lMi35+NZfE
X-Gm-Gg: AYBFou04ekBR61HS2lzlsfsds3RdQT4Tu9o+sk9gLQieUnd2uqfjkn9AqFZ6GoTdWin
	rDrnoYvE0ihV435LXrRmJsFXn6smAYiOn8yoIxIQKPR7WSe4gQUle65Wa4nv1QDzEBS6XTyx3yx
	us7iIcSjd8k+Q/XxSqD5Tg/BB/6U4LwRhgN0CDLhmIwzZiU9Dr/wP3TFwgX0fN1VplJ3oDW6tNU
	8nr8c5OTaKhH9PLPSTAqSKGoIvb0OWgtV6IzBTfZx8/kMnmdNKwvFN3EBnyXVB13TV/rz70Upyy
	UhZreJVMGKcyNCDsq26AemiAVlfDAEOZOV1W/KtdlhMcEqsnqS4DwyG/89Dbemu99m7e2+lyzRt
	/UfsoSH4BFmBEQevQ4IwZefNU3c/kk370uwmr04i9Pzt3kGzjmMidL0nFFFr+pxz/WLucxlFpLp
	leDBpB/jqMwRZcalSQ64qis45CaLy7rGNwg9tZ0sm1yrSv9ooM5vjOcHfwfDsYKYSoxLhJjMW/v
	e4j0jHGNcDvEBAwj9uHaVzpmEwal3T7z6UxdTTz3kK0gLWJ37OJbOMFs+Q4QX84NfgrunRQjGEP
	bJ7YtaOXmc4RG3zxLQXg90tq9qLCtrZxJe/Jy1QU7/EHizLxw0fwiG2+H2Ca7x86uLA+YTMFdr+
	ln02yRZ0C4I0RHDv48kRpeT8Erg==
X-Received: by 2002:a05:6830:25c6:b0:829:8a9b:de79 with SMTP id 46e09a7af769-860f268b747mr1620889a34.4.1794398993361;
        Wed, 11 Nov 2026 04:09:53 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dc85a9e8sm4218356a34.0.2026.11.11.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:09:52 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
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
Subject: Re: [PATCH v3 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Wed, 11 Nov 2026 07:09:50 -0500
Message-ID: <20261110-a7s-dt-v3-deps-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

> [4] A733 8250_dw v2, patches 2-4:
> https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

Correction: the runtime dependency is patches 1-4, the complete posted v2
series. Patch 2/4 needs context introduced by 1/4, which is absent from
v7.4-rc1 and the checked tty-next and next-20261109 snapshots; all four
applied cleanly together.

AXP318W PMIC v8 5/5 also needs a context-only change on v7.4-rc1 from
sizeof(*desc) to sizeof(*new_desc), introduced by b53a09c957b68.
After IRQ-bank v3, pinctrl voltage-mode v3 needs its hunk context adjusted
to the IRQ-bank map; its voltage-mode change is unchanged.
The older clock helpers are already in v7.4-rc1; no other input adaptation
was needed, and DT v3 itself applied with ordinary git am.

> Untested: boot with pinctrl v3, card writes, hotplug, 1.8 V switching,

DT v3 with pinctrl v3 reached an initramfs shell on one Cubie A7S with
vendor firmware. In these boots, warm reboot returned to vendor Linux only
with bus-r-riscv and bus-r-msgbox marked critical (firmware-clock patch [5]).
No card-write, hotplug, 1.8 V switching or other functional coverage was
added, and no new schema check was run.

Thanks,
Enzo
