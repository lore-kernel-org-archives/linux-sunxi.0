Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C642147E6
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Apr 2026 18:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777315362; cv=none; b=bLhz/lm2glrxIjiSoiJVEChlRkhjNy3zPMedUKmsrjd9JZWdJzKVsa0qawQzbWHZvtIpzJju5i50JlszXoNJ5Fya6dWd2tuTNlBzpdGu4ZzqY4zBXDbGkCdkBsn0tXOg4Zi9jIp5LyIkT8vgI+Ptv40WtOKk+YbuP/t9xaAHfD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777315362; c=relaxed/simple;
	bh=TPV7fprTQh9aTMAxXFg5RQYUMMzl0w2zWPCaS0HekcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HApN7mmw6wris+hz5p56mAMHJ4frH+zjZ9+PwYnm3vme0KYhObnlV5aQFxJeUVxo7YAxNg3iH5cQKxYXUWnDv9sNciUKV4XV6Wf+GDpDehKfhscIspOTXwTJKFW35ntN7+kF+ObbKnZXrWvsKFKBgUN4L5jMMqL6layHGmPnnSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rc/UBSXt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rc/UBSXt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso148585115e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Apr 2026 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777315359; x=1777920159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPV7fprTQh9aTMAxXFg5RQYUMMzl0w2zWPCaS0HekcA=;
        b=Rc/UBSXtepTpEjjDVXwJkITSYCyKso/Z4EZyjS+MKXpDLQTI5j4cjIOuiF6go8+1fl
         e4QM3FWVKSVdTZu05VeM9j7IJevSzsG05Tqesug1xLQqjEOFHVzH4nFeEhMLbfaKFCGT
         OMXSYiO8pTMTTjugGq3x5Ge6RxeZKaeYv5VNgUa7P89c8lGICOgv8X/R0y5T5Uk7eNCt
         Z9yn/bRFZ0eaoUiRRofS5xJMXVG+I+Z55HqIZTRM2bqFNlmvZin0rOtOtey1BiLu+pU9
         Ypdn9cx6u5QlsmxNYpgf0d+L+Bs8R8rOd+kl5ioogfGv/v0IN/UNxtpbardLHc5vMJx4
         WpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777315359; x=1777920159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TPV7fprTQh9aTMAxXFg5RQYUMMzl0w2zWPCaS0HekcA=;
        b=rcmcGHpohsQgFocuwYqEEtUH/9hmzfns8CSnOW8C74KjUHCq9ZfmD2dNUNfiq7886R
         gTJDkbuqRa+/zzeOs3whAx4hyukvV0tUcIZ1E0JXP10eDdbEoeRlgaOR6v0dJ0ag0SQg
         EZQnNUbmiQJ0sANhS+o5A1YjQmVevSTrRToXKmN8OmiDTlap/xlsLvTG+9CO8dklUWXW
         Z/G4b30GHOd0lufUNydQhCP+AG2OW/1T6a7GXBkJHRFmvPyTFQsT6eM5xJpzKmI93r2w
         Exj24YVLm0XauK/VPzHUH0rXDBTUhuaLPHZLY3skFZJNODSaDDuC6SeGb9PDLMxQ7X5E
         uAcg==
X-Forwarded-Encrypted: i=1; AFNElJ83NVEnhT3IJhjC9tBkMFkMW5FuXI3Sl3ud4w1PK5TcOfD/nPQ1qYcMhxJBO9uWbjFqVApf2CA/CPzJbA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk/KpUWzi5UCjtlH9xPwC8SfG2yXr/zjSGh1aOWfYb1eaXns5s
	MOT6g+ewgdUwp/8CCDc3VIpfqmc5VCOEIBsAmYgEt3C/7ZQC/Y8o0d19
X-Gm-Gg: AeBDiev/iZi6ovRx6N4KjmzQUI4oxPVrwqMHlo9NMJUu9sYy1pmsRsOs6xYeNH9oo8b
	yNjM9g92L4ifXcIoBnQgZaZKCOcdtH45YsGM0Br+iMFCcnIe+gTJOV8BH4EvmT2IfMmlcIBUY5X
	+Yiht0Cnc6dsxKceBsKVZ/9CX2gV8fw1leoAA8S/dw3LW/99jOKUgfxq2rrrNi7EkahFtfcIJ7q
	jHb0D2NwxT2qhSbyXKQ95g1vAJndDPYR6kr62Cmu4lvpNQnl2Z+LntDRFqTRCA24emMZPSLpx4/
	DDBonxaOhTNnOBcJRs/HA5y+5JpACapKC2//CmL7v/bFJhujG26rZJav4TO2n8BtTUG3u76hMgs
	d6j9+g+4l/PsHzUe5b2Uiux+Hd7pdPKJi4hknKeDhKNmmucowAVO4rcsy+EvhNov74WVaDijjaF
	MbIfzuLzbtxZYnoHHCxPtUb9FSaAdx03TW0937AncSilDWJBkFnbFAE68=
X-Received: by 2002:a05:600d:6444:20b0:48a:525b:e157 with SMTP id 5b1f17b1804b1-48a76f5ec2amr5679405e9.13.1777315359104;
        Mon, 27 Apr 2026 11:42:39 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463ff5a1acsm248347f8f.33.2026.04.27.11.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:42:38 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Philippe Simons <simons.philippe@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-sunxi@lists.linux.dev,
 Mikhail Kalashnikov <iuncuim@gmail.com>,
 Cody Eksal <masterr3c0rd@epochal.quest>
Subject: Re: [PATCH v3 2/2] sunxi: H616: dram: drop default TPR6 Kconfig value
Date: Mon, 27 Apr 2026 20:42:34 +0200
Message-ID: <X2fVg_noReChueXn-ZVndg@gmail.com>
In-Reply-To: <20260427135819.2577234-3-andre.przywara@arm.com>
References:
 <20260427135819.2577234-1-andre.przywara@arm.com>
 <20260427135819.2577234-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. april 2026 ob 15:58:19 Srednjeevropski poletni =C4=8Das=
 je Andre Przywara napisal(a):
> CONFIG_DRAM_SUNXI_TPR6 is the only DRAM config parameter that has a
> non-zero default value. Since we need to provide a value for all the
> other parameters anyway, avoiding TPR6 makes no real difference.
> To make matters worse, TPR6 is a compound value covering multiple DRAM
> types, but also spans over three SoCs, which makes it hard to find one
> good default value.
>=20
> Drop the default from Kconfig, and put some explicit values in the
> defconfigs for the few boards that were relying on the default so far.
> The value is taken from one BSP, only the lower byte matters anyway for
> those boards, all using DDR3 DRAM.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


