Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210981;
	b=1n0EA6V2dwfhO7j698LdYVjwSbUUapGSD9W1ASW89mmET+ZLShzq50dqwqLZOw5Ea0kx
	 QUuNTkoT1vueLOTbJfDHMBGzjelU8/ZLE0q5yBGDVrRmHg70//6NnSbIQ+pDqF9TrALg+
	 1rJjKn2ClU/FLm4lkv3A1Y5fxYzBdsJ2Y6lyBX21MyispUxqHW7j7oDH1GH1RywPG64px
	 DbiYmG37rxn/zrfQU9Dor60AJsatMQ6UIH6LHmt6m5pTms2eU4fKIex0ms22LSzryIlsH
	 mhVONJ1/HP1WlqBEKhNti1PNWxM97jE3NBHkc7dhWZ7ouHvLjHwhu63dpkvbOaZTaHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=;
	b=NSmVIjHQeIzbkoMqdKiHtTOx3mKyKIA369Hflc8I9IxM22hFMQ5dNf6OFy3h/5w0PKts
	 ia2y6rk27cC/AL+v5RX3Dzasom9SG30/TuDT1Ei1fAW66Z/9zGXEDuRgzo0vZKclX0vU+
	 kG//qar/HVlJM7egH0hBF9HIA+XHuAc/3pMn4qFV4SLU4qs8060Evy6QO4vTWIS8pfekx
	 uiF0oKkE5/Gj1IOPSYUBqrCWPiwPPSxZk09Cjh789sNt0J344/QZUic+hUan+cLoPuhpH
	 AJVweH5Sbulvza7dcUKl7x43JoD21DFNabyyO92Gjwim4V6kk/lJZ4ojsPRoKqhXGaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OtqnPbS/";
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE4960A2617
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 18:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE4960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OtqnPbS/
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so965476e0c.0
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210980; x=1793815780; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=;
        b=OtqnPbS/r1mxGh2AeqY93GqubzKxTVYvYhppasWcP3vg5lAGVj5ybHuAfs/wOYMeFL
         NAHOFsiO2UN8ijqkZ6dWl58S23Dlux98SxcqzkQ25nmxCaMivYa1t/6Kj/VuzbOI/77B
         YQB3qfX1LyvWxwA5riiLSm3uh4Ql/UaeHebV8uARM5/f/NSbNhCDMBO/NKFHTUhzJoCk
         POk27DsqzjEEnMLGBp80/YdrBr6fi0JIZ5NjJToMBTUvUGz+OVA1sDR9CMMW6YiAczFd
         1l79O2Tz2XGgiLGucsMiZh6vf1Xh63U3YL0ISNpfrqq5s463urlu4Mm44NtwnALtsIH1
         urwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210980; x=1793815780;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybFEGW2GkaWDNkvmGtInbPjCWSjYZVjZCwJm5I2kFxM=;
        b=eBcCxkHjFWbhfZKmikrluvnMH4xxmEivKX0Fk2eh9kPXTtZ9iX4yp85977/SosJhms
         e5scnk7rDN6ysqWn7kKuRB+AwJK7LoICk/ZkoNj+KtkuuerIRxnJGJk47ekNHR8tw7HW
         f+4KQnQHr5dbgYyi/evX1zTLgNuUVlFArYy4wCxvkkd9c2GBNsZ2Oc9fy5J7TgowjKaf
         QAIVb93GeaDjVe7WJ4xX8v33ykDh+sNaZYCMnlGZC1q5RycqWkrAkBtqXCH1/y9xDDDQ
         wzibciICwYWL/3T16A0au6ZYohezV9F2x1ZS8MYmypI5Q63H/fazOcUYDupfVxuO09vQ
         NDFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7ZiscQEbJefEhIdoeN4t3gU7qbkz+XbrVg1dxik9iAcjvPq1zv29qWsn6tLJHkRgNwOvGiOF325j9jA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ8pxkwfrp1rv/RZfZdjfDeYOol3d0cso9Lw64zkQUpn0IkZ+gC
	efZd1p8kWPyqcSVkWESWXHbukH82uc0Ya0jzj/5sEj1a1pt6byd7g6W/
X-Gm-Gg: AYBFou2VIL2Ka1Fx6cOs0j0Nx4gJ/U9rta1d7yFDo1avXbCPCpR0fPOpV6oK8KBLzZl
	6r+3cQAM91yZlLwbyhOiNv9+W1PkwRpHlAQpTEqqKHq43ODfBVZq+TNcTwTi+S23ekHxUR9PvP+
	870KaKwDDorX8yZfdk5Y8Ao/N4JGyWqdyqD2wuQYfMymbX/wj0FkCMvRwd859GlAbactpwPuIsv
	QU6tAaoe/81jK697sJXc83haHh3UW8rF8VVwbto6bIjHhQefjD773iUjVKa8I2gCRQH3UgW/RIK
	/+QbLqdASQzOQ4OSfJsVd0fcMah3Dcm7mAonr1A5sa9bMn2rxQw6fWHbxQ+bQ7KVnJCME8taIGM
	Jpxbmy6IUdZiub2vN71gYqwwtmypX1mjLi4yl4nzPnSMii0oT5XdSpNpHyZfocgVWrvA28S2uNy
	0XvYx/aaJL1E1Jh/1DDo39HHiSyFF7ClI7MiNqiU4wenkWb7sauLg8kvwrctKx05jqW+Ijvu7dv
	x6SJ/GIEWXywAFPuuwPBwn9eubkIm8blJbNaBu+wRxjrOAE+z6eOmvq1dCX++JRXP11uI+rN22q
	FGoZKLK8haxPSSI50TGLJ4aASqgLMYYDaPQz/ZpyidcfXaPVWnjpJMfNJw5RG1y0iGNDd53rcnw
	43WjN/C+GeF+rnMBBcukzyEAFlNY4EgZXWiUt
X-Received: by 2002:a05:6122:2652:b0:5ec:2394:fdc5 with SMTP id 71dfb90a1353d-5ec587d8fa4mr78307e0c.20.1793210979685;
        Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f93a492sm2588887e0c.11.2026.10.28.11.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Wed, 28 Oct 2026 15:09:13 -0300
Message-ID: <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
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

In patch 6/8, usb2-u2-ref is declared as a plain mux, but the manual
has a gate at bit 31 of 0x1348, and its reset value is 0. So the CCU
driver can't enable it.

-static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
+static SUNXI_CCU_MUX_DATA_WITH_GATE(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents,
+                                    0x1348, 24, 3, BIT(31), 0);

I hit this on my Cubie A7Z with a USB stick on the DWC3 port (the DT
and the USB2 PHY driver for that port are local, not posted):

- v6 as posted: 0x02003348 stays 0 and the DWC3 soft reset times out
  (-110), 4/4 boots, one of them cold.
- same kernel, only bit 31 set from U-Boot: the host works, 3/3.
- with the change above: works, 3/3.

Same DTB and initramfs in every run. The SerDes gates were also the
same, so I haven't checked whether they matter on their own.

My boot chain (U-Boot SPL, TF-A, U-Boot) leaves bit 31 clear. I don't
know what the vendor one does.

Thanks,
Vinicius
