Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9F414901B
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Mar 2025 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742629125; cv=none; b=Fdcr0Cp0mDej6N6fFPSaAM+AgdxFJf7w3+st2TSK0yL9IZ0E6XzzMs3f+a/bld2Umgqd33qXYSGiFF44jF8kul5OLpTUmjI2NUGpSq1By6kXFjrKuLUEgJv/MB2IEMPPiFtJR8SchhNwLYzsMQRnxuTwgwS1PbJtQeqdZpTFRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742629125; c=relaxed/simple;
	bh=ayMGlcqMwQb+ftuOYdEgfcPSnBDR+02p6diqdiWcO6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JODwT0RRw+ie7yck/ea0Sli8hvObdUzOmktpiMm/5Ga0HeO/na7D668TnT6rFcULQlVMRSDPoFB91csUam4MkFyahP4HfoicRPQQ7h9S/hodoHP63g+0Yz1ioJKolYFDhnOXLYAO1yr0Zpq3hu/Trg8eBKp9a9VknYEX6tSVvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h98BRLSS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h98BRLSS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso14846705e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Mar 2025 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742629122; x=1743233922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayMGlcqMwQb+ftuOYdEgfcPSnBDR+02p6diqdiWcO6c=;
        b=h98BRLSS4IRJVqurRABjSIXMeos/v+hR+SC/YYmTrgt890LuZdh87RuYWcWad/7hVw
         dWHOEDGXEOspaqpTtyD2/qX+px2gWmY3JWNwFL69sEijGmAVHMbcClObbp5jqe/YcVFY
         cjgsDkoLXq954mKr9QV6Y2PdTVjXcQ8IElbEsKMqpSwiQPuco8Dnwloe7MCuzOX1029f
         WzV+IEvfy3lgGpsgNWsE6vLNkLrwEr0vSZoxl+D52GDXtYNetoFt6f7QLgR1PkrG1qqN
         e5BFWq2vO1Fs2b8eU7wPSuclRrZj3Wu/Bf3zDfwybHgwepiPHLOn+3hdmI1O/A0PJ0BH
         /FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742629122; x=1743233922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayMGlcqMwQb+ftuOYdEgfcPSnBDR+02p6diqdiWcO6c=;
        b=ul/mpALNigpjiYk3+cd/DCLwGMiCz6CAuKndh+MZ/2oAOzn3XVVHrPQBnZfJCtJpUp
         Py/ViSdzfm3PgJUXpo4FF0Hg8T37Thxyfwq9E08PHzeqBZmFic7G6LNLTaxtPSuw/6SE
         JuUBeY2eWHclaQ6X1CE1tEdsDtZ4NokJWrJKiKc+OJ7BQoqLXejMlHhC5tU9yePTp0Hi
         vBYpW81SRi+iyutkIJ8SUKkMApV1BfpSzOTiLf77BC5Ot5kAHsqRWfJf6pS3dttYbrRm
         E/qFurH530Nicf1X1RIm2lS+cC2C4bjv6yexaqioGTpwerH/lFQ5E/boSIvXmfKTBhNM
         YNsA==
X-Forwarded-Encrypted: i=1; AJvYcCWyvISiJ715bvrOe/P/ZTekOUdcGnrq7S5Z1PxR3hxbaiEXUTTel2u6jq+kztv4p+B6iktkD/OZhO/kmg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywog4m9SjVQpsbReHpguveysAk+K5hOUvgcVVPkp1EKiocy5MCS
	lPy0OJ1Jgj105dunjCWRoZGrXgUcUS0Hg5xz5JnA0eSKrcHtXu2bpsE56w==
X-Gm-Gg: ASbGncvrWWnpLU3st+hVH0Qt5nl93csOsHYigFWX39UNMs77WpnGAjaRmK2YiTwFOQy
	6dXT3rzBN2/Sig8ggGssyKiesRbXweq7OvkKxFXZJ9bFvvpaNTEoLAYTJ++HyrZfN/PvyXiyBzv
	8iUecdZ9zpVzU4S70/BKueOqIgVjBNp67CMpkN14OqQqitQfbRB3iA/zWumDerG1DUCz4Z10h3b
	236Iq9xuQwfqEehUK/GtiTGiu55tXIo1vrJZjYwyqzWMLDP+ZlmVK2JrjZLPoqzVq2PB42+1V2O
	nl09k9JREfBmkignEXw4YiP4ccliCuSkFAat/IJVz0LMWV+PRpOv9AsYJqVJ94MgohejvlmYuMh
	wpuvO3fT8p+lavEW2PaoW
X-Google-Smtp-Source: AGHT+IGOAdcCQV9td5yBg/DeGMyuPfW6QJ09F7Nlor08PYOx21zTuurCfS0tdlMSsD+iLtwPsmEq7w==
X-Received: by 2002:a05:600c:1909:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43d50a213f6mr57806325e9.22.1742629121821;
        Sat, 22 Mar 2025 00:38:41 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eef37sm4347075f8f.85.2025.03.22.00.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 00:38:41 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sun50i: prevent out-of-bounds access
Date: Sat, 22 Mar 2025 08:38:39 +0100
Message-ID: <2772067.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250320155557.211211-1-andre.przywara@arm.com>
References: <20250320155557.211211-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 20. marec 2025 ob 16:55:57 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> A KASAN enabled kernel reports an out-of-bounds access when handling the
> nvmem cell in the sun50i cpufreq driver:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-out-of-bounds in sun50i_cpufreq_nvmem_probe+0x180/0x3d4
> Read of size 4 at addr ffff000006bf31e0 by task kworker/u16:1/38
>=20
> This is because the DT specifies the nvmem cell as covering only two
> bytes, but we use a u32 pointer to read the value. DTs for other SoCs
> indeed specify 4 bytes, so we cannot just shorten the variable to a u16.
>=20
> Fortunately nvmem_cell_read() allows to return the length of the nvmem
> cell, in bytes, so we can use that information to only access the valid
> portion of the data.
> To cover multiple cell sizes, use memcpy() to copy the information into a
> zeroed u32 buffer, then also make sure we always read the data in little
> endian fashion, as this is how the data is stored in the SID efuses.
>=20
> Fixes: 6cc4bcceff9a ("cpufreq: sun50i: Refactor speed bin decoding")
> Reported-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Thanks for fixing that!

Reviewed-by: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


