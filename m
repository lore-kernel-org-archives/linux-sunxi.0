Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2BA32
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 16:30:14 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d4so28688064wrw.6
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 08:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3EejsfMRPYJ8twdYT45Z3uPua4+S1LNtd+Q+9tbauc=;
        b=M17tidvmkWkYuFrf1Lwzlgp3oUKnmbk9v/FsptibpHce4ZAqpmIKX+7+UW6AAVTjks
         wRgopWPda293hciGNXg+8XT/sDP3ZgOuBT/PW5758mCviTDFDzxNKspr6lwpDvotggrJ
         9M5hg6/2Jgwf/JwvkipKBdIVdeT26Am3kAQSP4W1Q1fAyu8xOsyvWjC0OgLejsjghfI1
         vHOJdXdJE2vAXeo5CK4lPNmHhtGNU/X+DS6RTLNSke5C/CebnaLmUaRuMAhsIe+rSI5S
         pENvk5AB6SJAzxX7T8monl32sXTL+JYWbAVRIBc/DEFTpkqdCVmPl+sNV32PXh8DunrE
         VusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3EejsfMRPYJ8twdYT45Z3uPua4+S1LNtd+Q+9tbauc=;
        b=NwQe0Eo1Y6Lo4ztJ0/57eEVjEUWktfTfE1YJ/p0zjPnXwH1QlWLnFpTrldhiFpsAmk
         2XoAu84lQy/BLP5YnlPa9mDS7S123q4Mxp1DbwJoHdGkmmpad8Uc7HyvCJadFCVVAlsy
         SnXk10ofkxN6TrUBehALIr3QEy6ljTYh8G7QFgY5Gwjqc74ttzlj7Iil+K4PrE/zd38E
         JVivV5u+sboSBlEvo4ZRisnGZxDto0vyf0EH8xuXjkPz4vZU1DdomnvVItfNVVzrBruJ
         jjC5hPsuaQRWDkR5WBRPhah73NzlKVU+ACtKO9YCdKae6eHGffu3ptlMIgu7adiOAqA+
         F6bA==
X-Gm-Message-State: AFqh2kpd0QGMn0wa/rnB/bXPO2pwOt1kCvPH/tEdjhyR9xFskuoIc9Pu
	kql7zadzBzTTll0ue0alp6s=
X-Google-Smtp-Source: AMrXdXszLZ9BZFqJxfINjbGbG4pDRYZ8kDGOk2JHXjZcf5Xgus/zLO7jwULs6trog6IRkMTs0W2P3w==
X-Received: by 2002:adf:f183:0:b0:255:96ed:950b with SMTP id h3-20020adff183000000b0025596ed950bmr30694484wro.60.1672936212723;
        Thu, 05 Jan 2023 08:30:12 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id w17-20020a5d5451000000b0023662d97130sm37280824wrv.20.2023.01.05.08.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:30:12 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add crypto engine node
Date: Thu, 05 Jan 2023 17:30:10 +0100
Message-ID: <10201998.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20221231220146.646-4-samuel@sholland.org>
References:
 <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 31. december 2022 ob 23:01:45 CET je Samuel Holland napisal(a):
> D1 contains a crypto engine which is supported by the sun8i-ce driver.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


