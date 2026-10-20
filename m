Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493268;
	b=4IQKazuwoC50VFUUmI6uf8zIubEo0oa8Cyx8bHNgjiuLX/dCRWWAnTlzVLQteTtBsYac
	 JLubzPhaH2X+ExYqt3GXu9+Taq0eJtNTSFhBKV1TP7Rn97TOej4LqMgAUmPRJ3Z+Ted3X
	 stEOrVCR19WDfSpC8xWU58jKOHAtUyLJ08Lenp1+0lREbDH4OKcC2bgd5xhLH1BQXsVGO
	 AoUNzrk717rJ2mODdjeHGdRFzDrGng3S37ReE07qxGPIBeOM/EJ6yA7JpbE/lUsWU6xy4
	 UIcvqdO0tQWRITfwDrlzm1zqY9AwFl8SO3p0qhhWCB01qoHrdeL1RHkQtWwVWQ9VCng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
	b=SXxy1mIiNcRi95R6x9VdHO4GFPpr7yG/cGPi9GYl1wJdo+qJTj3xJSTXA910nN5n83vX
	 XMFlnILuzQJYNUQ94n+AG7fd9YxKqptSWxCgtS0lxCcbxykaXJsDOt0uzuCzjxvwP1XOH
	 aMdBib672LhYvgVVidTfcLbPZ90y+leSgbtNf+UgZKOIwqFRsD6oIgkAq3d/7Ccq80A1k
	 TFxWJspMvdbeSo9m1DG2/pkqTwnYk71sh023EcEZcvDpcWnZp9ymLw2hbuHUExphMmdPD
	 yNJEjJ8HUo4KYk3k98r46M8vOS0ZslVmCzG0snt/FKAU9517VdpCM0Kc0DvH+O502cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F97zm6s+;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4C60A2605
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 10:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A4C60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F97zm6s+
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-16079d54c17so202251c88.0
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493267; x=1793098067; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
        b=F97zm6s+dTaUhDE47TRx/Crg1ez6aDkxRiRKE+/ogPtnEyTeb5uvXwG250QIZiq3qb
         pVt+93fCwrEG6RjDlukJKLBy853WUTlHLhmDnUrx0CmyLabVTUu4HY1LxJWTGr/NtTyA
         aYjgdqwambBppnwpun2r/JMRbTM9LNUQcsHg3YDuJcz+CPQosKlgQ9sfM5dJl6tU0y1I
         3n0tqoxmYry8SM0ZgwRMG3fWg8PdFVunzgNwweAmZrLlui0OHdeSPFmSDSuR0C8D6DAI
         i+sLaYO5DuTm9StVabjzbnXkys68AMZEmPuyijBtgvtArAswLMHngJrxaTUcQ9BHcHQi
         15Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493267; x=1793098067;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
        b=N8Z29MucEN7rgtK3+D+/e99um5yJiBWkzhTHLWknoJ6V9MT5rDZCA804VSROrLN0Mr
         1T8CLmtmuTZN1WrNn1/bVJUtKFWIBIvgD4u4PA024RY8Eudcpi0ABGW2dH0YNQOO+Rmq
         MNA6Ec90etJ1omhfD7y6jdrHTXRVTSRrTszGt7qXvtWCrsp9MCvs7V7OtKYywcetCSwa
         +otohvpQAgltUBolkeLEB1MOJPycWyL5EOORzbVAmIoFFKXNmjay4pzHqkuimdMHxFV9
         UUTeIEc7MGQShQddm55r7nPt1uMj/rJHafjp8srcZx8HRcnPEcq2oRdWxZadVZ9atPCH
         Qpdg==
X-Forwarded-Encrypted: i=1; AKwUvByiUt155BeyVaIYevYud8jeKmnS8CQiGXHLb6Af8qBEvPhBoR5Dwy9f/OTdO8lenMPdT38Wi/yZUaHPEQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJKjxGRRwt0ZTyUDTdV5ykiQ2wnIpUNFD+SY0H3xLKF2PAreQVe
	shcTeTchVRy+kJId/umHyaETYzTSLKYtNiy5RZl5GF2BEXwpRX4ghJe3Ch5jim3ARfiBxw==
X-Gm-Gg: AYBFou1VJ66xyC2/IYgq2bhYHxxC1GsKalBOPQpqLzUy/MY2cGPxMn5fZnGpvj2frac
	t6HswL8JZpToFnIJCn6g8fmJgUAzwKP/6oWI/cqKa3jxcbZYgbKu1TzhS3R1p1WvjsC/fwuFH1w
	hbX6mazcYlw+uF6IReigNzIK9eezh/SeRU9ymEBz9PRJviB2vRGttyefkA9wgWZLImgEM8ZOidN
	uZSjmsic3HG7kg0NLczso6BXqynMgpCHbqWZ6KG048ld0+EyqdKx50l70VJE16k5feM9Y21S2o7
	ltTo8bD+QSoQLEtK2DncBD3ft+wjnR88j2OPC1MAul8HGI2PeRnaJFGtgdbdX5dUhfF0rn7YTi5
	AT4tVKS9d+onthdGNrhMF2PUoa10g0tkpzU8bXM7wlT1/WkNT7BQBqtissJlEmfT1OHQju3Gx4d
	tK3Dutr9syINaoU/Qacdiy7fof6IdhquqySJtwGckr9FUDTAigQ/6zFWI88e3wxQS3SbM5tPGyr
	P4AlVaPbV5G1kzgtkzxkQMBlXUcxD+wXBAIPq19KEXb8IU0K+SzBKhzaD4s1JV7HhhkkCzAc0xI
	xL4mLJ4=
X-Received: by 2002:a05:701b:4511:20b0:151:2068:e81f with SMTP id a92af1059eb24-1851310a457mr14502929c88.27.1792493266915;
        Tue, 20 Oct 2026 03:47:46 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm34662429c88.5.2026.10.20.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:47:46 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Tue, 20 Oct 2026 07:47:30 -0300
Message-ID: <20261020104730.28646-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org>
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

Hi Jiri,

On Tue, 20 Oct 2026, Jiri Slaby wrote:

> Do I understand correctly, that this equivalent to:
>   if (is_power_of_2(reg + 1))
> ?

Yes, given the existing reg != 0 check. I kept the explicit form in v2
to keep the change minimal, but I'll use

  reg && is_power_of_2(reg + 1)

in v3, it reads better.

The two forms only differ for U32_MAX, where reg + 1 wraps to 0. But that
isn't a valid DLF readback here.

Thanks,
Vinicius
