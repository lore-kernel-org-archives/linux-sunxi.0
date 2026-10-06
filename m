Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDC7387375
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Oct 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286405; cv=none; b=N/xY7KRXRtBuETrEHo8XIW1fwjXDXSMNSv2C5+7QABGiBBdWzgEfOOOl/JaeazQ32LskLAVr0hNWc+jRjTotIPvKeEzbxr/FNSzQToZ+7nCUQX1jHVL1HkCmyzR+EMWKe/PdgYEeuIUHUoKSyZm6tmXBcTdIt0+zb0sDeAa2REk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286405; c=relaxed/simple;
	bh=K+paxjzoi7IzgH+mfHtxQm46Je8LqMNkCno24z5At/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rduf/Bu+6BFwmBYvp9Ogn6OvUli7HxAuBHKoCSlYNn4mQDZXR6K2ynOJsCRxsBIci3hE0TIJXlYRT4Nk+coDKtRJqT8B0LchhEtRWhulXZxCL19Wq+ToYyVyTYgvCPu61xnbanKI0h6ePXry2JAUf1Bs0TM9HzxQ4Yw6sAL0TVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXHE9X4I; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXHE9X4I"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1419d3416ceso4545876c88.0
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Oct 2026 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791286402; x=1791891202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+paxjzoi7IzgH+mfHtxQm46Je8LqMNkCno24z5At/s=;
        b=mXHE9X4IaKoqurJfxXuO20pkbbL7IeNqdiLGDXqltQmhNOcrmu3ljYXOFqQtMMkqqP
         Tv4VQmYRie9AM3ABvrY2onrXBuB47LPIHUVww571w9NE9YMiH6hqUkp7NXYsiHL4IePK
         Avx7K6pVoP3nhiOx8VQTGBk0o7gUc9p3Z0TpRyBQS4LH34k9TQcqaKIdpbtE/GusvxzZ
         DItTFSOaEsvCg/t97XQdLK3EDoXZRcx5I9oGZs2Tye83AOVQwDMx21X5Q4Q3Kum89ZsT
         NnjkjJ/BAXiDtAIumeMzcSTZM03nbUdCLJF2JquNA2o2b8GZcvRwP+xPC7grv/4Qj2pX
         zBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286402; x=1791891202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+paxjzoi7IzgH+mfHtxQm46Je8LqMNkCno24z5At/s=;
        b=cI8DyZUcnwZt3pznktoR3n9Zck3+rwpD9OJ7mWbLCfhiiQZ/bqLKkk7Y6OlY+rdOnR
         EVCiMjyK90YhFsWZKV9v5Snbs8HJZ+hQQHh4+dj2X0FTaARcJ7qBb0xEQtfW39A1rMHi
         Up+MuOT1IqnxmMVgI1Mw7yGGo4+aUf8iZJee4EoiYtkzGiLLtLLYOXQsvQzPDm08KG7t
         ob2OD0cXvrysxDRed838AVye6ITWnF0CCkUufYKoAAstz40z/TmKhtZi8iu6dBrKdkNf
         hQtz2PLR6bNUmRXPH2Tx6jY7NtwMUbB+Qj63yeQeBF0qO8pO4TAMsrVZGl+6cZYulOAV
         quyA==
X-Forwarded-Encrypted: i=1; AKwUvBz9eWSnQLl96NQpJL/V+1iXpZGiFccg91PccOMoLKFt/J/qTG0m3VFy0fvwxzAz76xS5gpq/Oq2/yzENA==@lists.linux.dev
X-Gm-Message-State: AFuF++ncN6xU10r5uwaWlPaJXgGMYtLCub4OOm8bavLN+N4nQcT9Ix5w
	oFNRijKRFPi2FWhlOcYegLBht45p3/93eeotOF3VlZGW+6Rf95t81jCr
X-Gm-Gg: AYBFou1oUcV16tkVxiQ22I9yUJ3lTF//nkQzkGDVdBmJyqdlKlsLNsDsABMnebh13sL
	mJM7D7efctRI4CTDGGafWwlLjsCivV7a6ULBYQLf9rcHh9V6oCb5XItJ7ZN4hBjD0XCmYFu82k5
	3vSl1TEGPKCS3sTvt1+2PNB5osL86sRrIueHKuLqjpqY5pLbNXOHkkZueA2a85TkCT7QGj/cng5
	qnOqeJ8MIiASp2hWa1IOaN/l2kpEEByLYErLTvx9dDUolZIN9Idmd2fPLCBlnr/7kJkPs6mBdUI
	E/K6TYHIWnBQxT0i+gWn3d+apg6oxlvMAo2uinJJAAU3iFd0HrKfFrGjP9oe9qgBnRA7oO3bJWZ
	I/9DP35ipl/yqu53bezhs7eu1SZsmRE/rlsnBw+/gH5IFloh7GoCGVk2N7WPytM1ijvYGU5sK0y
	8xT7rOao1/JXbDzCXY960ihSjuzZ7gOi9v4NB8LxxP8qtl18EVMwtSHvtjYELAThMEzT4Ihm3x0
	EGDUhkDyoohBgnM77N1OHb2moBJg3+vB+mKR6VXATVgDcweUgpielpP+NVJ+hKHXpcAc/ivis5m
	9SUZ6g==
X-Received: by 2002:a05:701b:458c:b0:148:bbae:ad2b with SMTP id a92af1059eb24-151c2b16e87mr13424090c88.11.1791286401479;
        Tue, 06 Oct 2026 04:33:21 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d7234c2a2sm10735006c88.0.2026.10.06.04.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:33:20 -0700 (PDT)
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
Date: Tue,  6 Oct 2026 08:33:06 -0300
Message-ID: <20261006113307.86417-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <db561de8-cef7-4945-93ee-b0d434eb806b@arm.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com> <db561de8-cef7-4945-93ee-b0d434eb806b@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

On 10/6/26 11:46, Andre Przywara wrote:
> So I was wondering if we should refine the DLF detection instead? Only
> when the readback from 0xc0 returns some 2^n-1 value we assume DLF is
> implemented?

Thanks, that's better than a per-SoC quirk. On the A7Z, writing all ones
to 0xc0 reads back 0x19f, so the same family as your 0x9f with bit 8 on
top. A 2^n - 1 check rejects it.

With the check on the board, dlf_size is 0 and 0xc0 is still 0 after the
termios stress loop. Without it, 0xc0 reads 0xb after boot. I don't have
a UART with a real DLF to try.

v2 puts the check in its own patch and keeps the fallback, with the A733
compatible only selecting SKIP_SET_RATE. On the fallback alone the same
loop leaves 28 garbage bytes in 3000 lines.

The probe itself still writes all ones to 0xc0 before restoring it. Would
you rather skip that with a DT property, or leave it?

Thanks,
Vinicius
