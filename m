Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796A630BB9B
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771434; cv=none; b=jNBF6xvaIk4qaV5TYy/Fne9AWqb+Ff2FlyQVS2jBoUEYrT2p3CMr6lIRe2N0d1JmXCBrrRuGaQ4vFfgpCzIjxSRbhOSno8fzIWS9qKPUMXXV9ZFmovf8/mnaYexqLRd8XzwcO9PNEljkL0xBFZy/fNArWMCehb/tO5G2cZQw3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771434; c=relaxed/simple;
	bh=7ITo30yVDRiyNeaOTza/RVMMjSQ4GUAnzLxiGkDOBH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YpMLotT5ZCaIN0EnL4l+0tLWZbKLzFS9H+hFHaLV5JqHPfQUvqqMLq2vOAeSxVUkUE8L16YcSbHekobAHPCeV65o9li58IKcGgh3BQWv9+t6uXKrSwqGmJNVGdaeJ3KBPxAyuFNzddBheiN4KEQVnXjBiWTWpGWRHzbQMHkF/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0pkQzMo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0pkQzMo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49802c418b5so18299605e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 08:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771431; x=1786376231; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9JR+n4XOC99wox2307V3vRuKtHHH2tWYkjolStlp9b8=;
        b=A0pkQzMooUrKRgAsvIsE/nyMA0HSza6o+awpF/BFRogpfOp+kUchXNBHanBysYz4w5
         FbOQ2ma3UUUcE2O/PsewA+j/xHqWmRy1AznyXf8ZRtstQM1oQuuCD+0NAWxvo/YQLppj
         FAI1zZ2c1r0yO5VAFHYtpZjZ9WglsJdvsjJtW8mKLxAz438SSEjfauzltQN7BU0TxQt4
         8Dt3fnkwEnpYDFbAooUdoTcZ25skPFXYNKSW/39DstxRk+9mNEgq8nE6pFnoTmOsImkW
         eGoka/Bo3oAG5NDtNsB7izLXU07BZX2hzUr7yMvfOmNcf4DzD7QTdZ9jAtZljMsn7npW
         xPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771431; x=1786376231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JR+n4XOC99wox2307V3vRuKtHHH2tWYkjolStlp9b8=;
        b=hzh4+3YIiGIrRI5zOg3dbts6bQqHqutsv3xUQIM67z4CRinnKDWJtkR9za0GUrL2e3
         uOJa1xDV6k51ACPxlL59xUOumtV0C9E+QW1Woed9hzKUMjArNAjFbx+DdG5/GHQGpnKN
         YxKQ0tWZlmLHcXtqMRrdZ4gf/4ky/x/ZfjPxFeKPxVaQvz0mKJVWrNLo/D9Ok4QSV5Wd
         gRdqu/S7h8MHDy+ioN7aHSIJ5ne0odz6IPdUwZXn8oTyztPm2UwNWxHNfPjTzwK0so16
         iTEnOuCb8lzYm90oXDRw8O7Lqvf1zyNrbdwamdOY2yVZPgmkfbH9BL7UaOAOHK6BvO4r
         JwjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpiic3SjzgWnaqXYqYxenhxKexl6qEGOuyScaAdneT8Z7oEYDG3U4pePK8Eogr6g8nlszzJxRhCyvvhbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsjp+dx2N94FSUy6FUv2oj18LPJkAPNIHM8xtTrlAYAmeuSXvU
	sB6HbOkuhev3K8ugb9FYNaPEx2AK61yBB7h0+x1Qx+TrKiuWcN4ssQHM7iGxk1l52qQ=
X-Gm-Gg: AR+sD1017AZ9dPg+dkyTaZR4i4JA4V8oGzYlKllBNJRkcUc+AbgqwTGq9Rv0y5n6ab9
	mWtZh6ADkDYMYpe4BSsqfW2UtUuzJc5NiSsIQ3RI6MrsKivRzkYlP5ySLS2qDliMpn9doI+Z4Fz
	bsNjlxdfhFKOEuAEt1gVzyjkwUYhlLL6/W8zm7dGTBXrbHn48uWLLZ+XzAHjNXHWFIJCCGSIPQ0
	iA5guH+KJfDv6j+YPdNQSV9MITVKUjewRToCTKmxQVsZVVwyvxMRqNUIgWHyIQEemThHS/PWabj
	zIkRxBAMJt9ox9e8yfLAADgQF1eg2t+0b136GkGvtZ8MrGXbPndPQzhgnfWvkJB/rYUiJt1HpqH
	jBP0AjbgChaCHUzJs969gytCWFoSenZa3qstneuVCpO/NnHX6FjRfPIN2vard6VfX8FVkdWeWch
	mj2i6IhPWqCDIFkFp0LecBZpi2daM13p/ui4+yQ2ULgHHGfQodSJsjjy9RiH6hTlAZcZ0bqINeP
	PtXZF5qOZ9afEKSO075Y+8=
X-Received: by 2002:a05:600c:c170:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4980c673ca5mr280126695e9.14.1785771430446;
        Mon, 03 Aug 2026 08:37:10 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc6d82sm751455e9.1.2026.08.03.08.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:37:09 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: wens@kernel.org,
	andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Mon,  3 Aug 2026 17:35:19 +0200
Message-ID: <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
References: <20260721223956.13665-1-andre.przywara@arm.com> <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com> <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre, Chen-Yu,

> So can you please double check this?

Checked on my Orange Pi 4A (T527, GMAC1, Motorcomm YT8531 PHY). You are right:
PJ10 is not needed on this board.

PJ10 function 5 is RGMII1-EPHY-25M, "25 MHz Output for GMAC PHY" in the A523
manual v1.4. The RGMII1 bus itself is the other 15 pins (PJ0-PJ9, PJ11-PJ15),
which mainline already has. My claim came from a stale comment in my tree, from
when I was chasing the dead RX. It is gone now and my rgmii1 group matches
sunxi/for-next. The Tested-by I sent on 22 July was already measured on plain
mainline without PJ10, so what revived RX here was your withstand fix alone.

> Those settings differ from what's in mainline. What are the results with
> those delays?

Measured on the same board, DTB-only changes, TCP for 10 s per direction:

  A  mine (rgmii-rxid, MAC tx 100 / rx 0, PHY rx 1900 ps)
        TX 0.938-0.940   RX 0.929-0.930 Gbit/s
  B  mainline delays (rgmii-id, MAC tx 0 / rx 300, none on the PHY)
        TX 0.941   RX 0.929 Gbit/s
  C  the Ethernet path exactly as mainline has it
     (B, minus motorcomm,auto-sleep-disabled, minus PJ10)
        TX 0.941   RX 0.929 Gbit/s

All three saturate the link, with rx_errs, rx_drop, tx_errs and tx_drop at 0
over roughly 1.6 million packets each. So mine are just other values that
work, and I am dropping them in favour of mainline's.

> ethernet on the A523 has other problems. The performance is really bad
> (even RX), and there are errors or packet drops.

I do not see that on this board, not even with C, which is mainline's Ethernet
DT unmodified. I also checked the YT8531 auto-sleep: the first packet after 5,
10, 20, 30 and 45 s of silence came back in 0.21-0.24 ms, no losses.

The kernel is my own 6.18-based tree, although stmmac and motorcomm.c are
stock, and this is one board with one PHY. Chen-Yu, which board and which MAC
are you seeing it on, and how do you measure it? If it is another board or
GMAC0, I can try to reproduce it here.

Cheers,
Juan
