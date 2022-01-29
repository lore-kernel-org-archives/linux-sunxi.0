Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D652C82
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 16:10:48 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ka4so27002776ejc.11
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 08:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xVPj+VEQQ3LYgC4VTa+CDcy/JvZdQrM76WmfxElEHv0=;
        b=pwnCMHwlg1pPWvaypMGET1gmill5PIBCUAOD244rVbZ1GLf4VERuyWGxuBeFuBUAn6
         dlmKvYFvUad4eUvgNCcUR/NbuBSxwzffOOr4LNNrRkahhScyYZyKFkKGZ8ZmBUHICBbu
         HFhR8JR/IhD2XyezsIHuW2rnwtd9ITkNY1QvbAI5NWK8WmsdJ2UDZY5FgQdb7S6r3I9V
         aGqYu9Ya8NbYOp/AMC1dQhZU66V4H3pM5jntBRvnD+4ZGzD/0WfaiIJ4Aoq3KgQ0NuBM
         QOPpKjGy7ERs1AJYG7cm3sZuWVjGT0hIwoSs+J4PIzdpBAraDHklUIOntDIlxnsqebnI
         HZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xVPj+VEQQ3LYgC4VTa+CDcy/JvZdQrM76WmfxElEHv0=;
        b=7WfneqQlDkVTYZ8IyuyszcuseW7/lM271hrRPXKy96hQQaZU4FZiq7Z12IjEblMTvh
         OKpnMJO58xkM5w/Gh31cayDqbcu5AnH9Kkt8X2MJFQlsquINet7XdNEtka9CEoOORvuU
         e45p+xMUaxMJ7l4/PpEPSfUD+KtRUqWoie+h2ZM/ZRimx+9/rsPn98VliNIGzYpmpk0K
         LiGIy+dhjFxZGZXa6KJc8HWvKPldMaldlu283ukTFClqAfpVp0ndY8aSONUG40kuql2+
         KHnidu9rztNan9uv+llPQCnUNI9FJwbg1HB4tGTaNWe/U5m8IHM+nTjYsjextwjeNVdN
         LdQw==
X-Gm-Message-State: AOAM532v5qf2JPIF9RZiOrFpatR2i5YTgddd8VejwvgMVstoeMITkDVO
	qgCQApDYzl/oRoSLHW5ObqI=
X-Google-Smtp-Source: ABdhPJygDakt5EVlzgvPtffW4d6Yh34e0wGoY+6IpK+Bc2m1ePC/R7ukvhwI8vnXSO3DeAuPSUUDiQ==
X-Received: by 2002:a17:906:d967:: with SMTP id rp7mr3836870ejb.543.1643472646929;
        Sat, 29 Jan 2022 08:10:46 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id t13sm11166528ejs.187.2022.01.29.08.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:10:46 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, =?ISO-8859-1?Q?Baltaz=E1r?= Radics <baltazar.radics@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, =?ISO-8859-1?Q?Baltaz=E1r?= Radics <baltazar.radics@gmail.com>
Subject: Re: [PATCH] Add ethernet0 alias in Nanopi NEO's device tree
Date: Sat, 29 Jan 2022 17:10:45 +0100
Message-ID: <5534722.DvuYhMxLoT@kista>
In-Reply-To: <20220129154214.45629-1-baltazar.radics@gmail.com>
References: <20220129154214.45629-1-baltazar.radics@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi!

Dne sobota, 29. januar 2022 ob 16:42:14 CET je Baltaz=E1r Radics napisal(a):
> This is required for U-Boot to generate a MAC address for it
> automatically.
> (Without this, the MAC address will be random on each boot.)
>=20
> Signed-off-by: Baltaz=E1r Radics <baltazar.radics@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks!

Best regards,
Jernej


