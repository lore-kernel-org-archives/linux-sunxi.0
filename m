Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698922;
	b=ysXWXE3nvFhUq3hdksmx2lj8DG6JsnzFvqY/i0tbWy+LBGioVFSGugv2TihjiRepEos+
	 SVBkEc07Qwa75uwkCIe6MD8C9+AUvN5FepQNDKBAJVCHpCQHBNfYG0Mx+8V0yVt1gKY85
	 LGlZ0vh0cqLvK/Ze+YG4fQnqkO8eOnefzakQRPJf+joYrkg9c0vshdzxPSTrmJkbnakOi
	 4TFYIbFa9hySkwTo1W840MT8QKG2K1fjg/QO6kQssNvPAwGLR6foxNwhxT5bqbCcJlzFg
	 ij+CHxkE+YS4uvL8LxauD4Cu/9A3aoDruAdnwoL3ubOAPp41A6eomJEz9934DbqxE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
	b=4JQWmi6s1yA94baoPwsvx7uixxweGfmM+kQSukD3arfzBvwJS7yahDhCqRB0fMJqTqZb
	 IxuU9LtZ0ilBO6wgk0RreLGeJ5BTCUvjGccjFXps7IPhO5CSjjgWm/8LN1CEwHpqgoqVq
	 pChpzDGzwuPAFdaSiJkhhR96vfJi89CDzjF50nwX1nSjjpley6OxK9EqGbQUp3DxfUMus
	 EbbzzpeqV22dYQLP+sqenGEQT8bbWWAIkFPrP8ANp28K2glCke8Sk8AmMfvyLWVUStJwL
	 5e3CGIWYgkaRfy2FHtKDPQjKAl8J/Bwr8ici8sGeQGSDpiqp2+OOVIDx20DB4smQCwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CUzFPkUJ;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C81606A319
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 19:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C81606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CUzFPkUJ
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso85869e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698920; x=1793303720; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
        b=CUzFPkUJwqdWW74qPNWxF584fJlU4GMY1OM+xfMhVBsZD/lsBmJy3S8+oMqJTUOLp3
         cp9QQ57Hjdt2zZMlC/ebk6JfaVnEPYOPs9nbOjKhSHBxcL67Bgq/r2AvK8Nrs+lbKZuC
         INdfRLXvBT5/YdvbABClOqVEEtMbmta6QBN5rtYxUkHFSWZ9a1G6Q4Ctx2EvwJnoMpNm
         QlsXlLl8Ni4xd2cV3bfhQt1dPkEhwdTHVJmAFT42V99F7Jn9toCE+ySHDnrbhKLYA9S4
         RdrdEXpw8slC+rp9VEq5OgshPHdWq/nTzUeoxGQopb+BcLkOzppgZqt/fP+/qHRQcGQc
         K/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698920; x=1793303720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
        b=on1vpsNhyasVcKdb77r4ER7hFhCyFJfY9g6av/VC3pkCapJXvtRkn0HQ9f5QPXaTmg
         3HeC6+C+PQVjPnvF47D9yP7F3JlGUhV0+RMSVGoiWuZLM/8qCm9HMHzSywmWWgrmDXuV
         PTVCMPqwLHOo/obHDr524ryW1t0mOkr/rXub8omibRXcwHiAqgL6AEDMMiDUGzfW9Ram
         XtIILK9nqjlJ/FgmeypJDl/ezJOE9g8jZAT/Fm9f3AF+rkCeR2zNdNC7hcep90JtAY9x
         PXyb9peMuY/KMLV9JCIqkXYBvU4LUBqjSTbVBxbd6eoXGnDV/JVtAz6dBPRJ/k7ABUoC
         vOLw==
X-Forwarded-Encrypted: i=1; AKwUvBwDSf809e6ao93ceS3vHE+3a+pTKLP4N/pmsW6Sg6WEffLyKoA4462ZPI3tMk8M7INAdXEnfKBbsUqikg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKpHmiYQWpRfnyqoPrK96ZQXL3EmSGb7Ws4VgcUE8Z4DBAvtWi0
	id77eSImNNN7QQ4/W8t9XxQ5/Orrs7G+CzHo/SwVTV8E4nr0EtXB5mNy
X-Gm-Gg: AYBFou1fibiTZJ/ESl2MBUYIkzMHPEKPNo1U6PIZ1YYcKwHS6QBnTmnmw2Qlz+57BrS
	ZXsAgZ4Se/LRfOGzWRZmvJ2Rtw2LGnlaO3iC3gHmrX+DvbpDDWAV2jCF4x3JbhHLCbUudswf8cb
	JxRv8sxpTd5AOomu6S5ptHNLG74arPoOe6djx8Xq6TzjtS8mexJZl1ikriNKqSbN8h2z+6AadI7
	wKQ1TFXZ8Vq67yYkQQ1tPLL92JPHq98933qq104aInOTf05Pnl/85dGUuvr9iYBrLT140jGUbNa
	OGBLTkuOz/7FslPWAvO8jTwaHPCYY1/VSiVT17VmE6zFLUSZtPFlJg2LwIa58D3pkfJnQFyA1bb
	5G5RLrYoZ4T96q61mbjWJlFkxWVz2YznWGqdtL/gJIkJCoEj4qK/oJjr5dv0dP4odAkCYKp8Hyx
	RFQAfwys1UaXlz8GvMh4fKtDEibFBMdR+1hOD5NRBG+NISL+b1Q0aXcFMrvsYFu0Ax8RKECIYr4
	Bjeya1lA4AiDCv4jcsC8jCqbm30Z86JMczuDffbm8fxdhe3foCKv1wxuVc34ym3/oW4rIRyVhOd
	7l8LtArPCnMjGVXxKQ==
X-Received: by 2002:a05:6512:a83:b0:5bf:af5a:cf26 with SMTP id 2adb3069b0e04-5bfb06cbcbfmr4297e87.2.1792698919896;
        Thu, 22 Oct 2026 12:55:19 -0700 (PDT)
Received: from ik5070.localdomain (82-131-69-225.ip.elisa.ee. [82.131.69.225])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5bfb027d0a2sm30503e87.36.2026.10.22.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:55:18 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Thu, 22 Oct 2026 22:54:26 +0300
Message-ID: <20261022195447.2007440-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022211952.7293f8b6@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20261022190203.1998156-1-indrek.kruusa@gmail.com> <20261022211952.7293f8b6@posteo.net>
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

Hi Wilken,

I observed something like a 4.5x slowdown - around 12 us per take/free on
the C906: the loop with the lock runs at ~14.7 us/iteration, the same loop
without it at ~3.3 us.

So yes, the effect is material.

Greetings,
Indrek
