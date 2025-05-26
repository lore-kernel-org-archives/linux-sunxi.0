Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452C1E7C19
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748295137; cv=none; b=AjGiKA4dqxVjSQLOQy8EzIL00JpL7A3dxB+hCA9WR154I6VT72NMATmfCqPaIC1fYrhpPcMWetwb0bGWV8h5fF6jG5ZYgecwfQojEmmNc3MZiTPyLCdAGEn5JqrHel3wu0Pgtm/3hNpc3GUq1jkrHayYWawRJyWHpEzQNyCqpfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748295137; c=relaxed/simple;
	bh=8SuyawwOzMJT3mItihnlzI4S/30pK5tVEVFGLgLFAdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjRq+Y15vurv8Hf2LjshO+KYWglMzFm65JG0fIxnMxc2xx1Hp+cRg4I2prdkuuwckn2J4ORn1J7Ncov07s5TXOj6caUQsagKX+QdqGXebyB6sX/pD1/efoNamj9sP9cafEdQpoP2rlTz2a10nfLa1ZUvle+pK3TsKqvCfW/wupM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK/brRtD; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK/brRtD"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5259327a93bso607446e0c.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748295134; x=1748899934; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzpV9AN34TI6kAQfSgmCAMHhHbvNRBBzplgVftxgPoc=;
        b=UK/brRtD9mLabiwFo9e38WOmOEy9mlgGdZKgBtz0BcvCIYzYTIBa7gii89V1vrLuu2
         IWX77HYboOT9E6uh3ApdttUp/sTG73czZUVDkpLoKOs+Tm1YQ3ZYsXgxgHBtjhamRQCj
         fEyzhw0ceyhUvTrSfEiQAmb7jJxVPgZ8vhd04C1MrHk8t9AcYHxpckzGW8hijU9WKbT2
         5fmwPWlToTp7Q1s15PbJEt4enFps3VTLliJvAD4IwUBXPBIdZlU5qnITgFyV6jVfNUP4
         3r3EL7/NMk5IkSEDidLlQJLC54P96Lcv7CZt7dKkRbaQ6yIVkHOUrBJYbKcjExF3XY52
         xgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748295134; x=1748899934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzpV9AN34TI6kAQfSgmCAMHhHbvNRBBzplgVftxgPoc=;
        b=OtEylCbq8IEX24xkLCwOc/TSAcaWhuXsDbKYfCDG9dLj0BBX/z/LZPgVx2qaK5IgAk
         KNUN2qB6ZQYxP8roUgOMGY+qAxjCsJsqNPanSSuQILyzuPaWM3zjxWn7h48pLpDcmJaC
         6KM0d3UCgI5p+HhvmpicWouglvmN6Lb2OMS4iC8dybgi86NQdV/wjTizpmG2IyFROcjb
         TiHqXenZ0hvwqapDRi9QvbW7+JEEfmmlFxxgooVJXa4wwqSPGeMrmrtXwNr5FEruJTIq
         HYc8FsNxHARDH907tfrHNi2EhJ26bR35q/+4vxsvJtyR+nNOp6n6NabYPBLGErXsZk4e
         yRnA==
X-Forwarded-Encrypted: i=1; AJvYcCWHwDT3Wa5LFRQgfJAd48asM0wKnNjZplOnbjg0QB5rh13Mo23u7LiT8YSWhHFb5An9gD34z+cY7JXSEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvdHo0IrpVfdB6jNMmylnlLBTCmMz0QWlCvZWBuV1KpdNoM5Cr
	qWdQjVq+0klrHIh5zgJ4PALzFoNgHcvbiy8pxGvYW9VkeH2V//QLLWFWpVqM+97Ar7+vLMTexTT
	Gtv6sxvwec27YvEX4BIuKDvoDTR8V2yEV4p8mzR1maw==
X-Gm-Gg: ASbGnctE30pteVKlzXyQuoKTzghG4LtFIiYHnMdXwqhtofHpW106WaIyHKMovUg+vYt
	LLfioCiMQMkOkkZPSZx5r/1VKp1aIFIOOTIsYiZNcS2h5Q1zR4sm1AtcK4Ut9oUDkgGzobYUeS+
	AqTHjxcVMRSxAiy1D/9bgr+IEOpfIz4QNgRQ==
X-Google-Smtp-Source: AGHT+IHtZAC8edhOL+psA4G3fkxBszlG+/mcFK1gxSVp7v4PGsINYvWQPIQCRIQn2+sMGuqIUnNiH1ypKvmk5wpNu3w=
X-Received: by 2002:a05:6122:a23:b0:520:3536:feb5 with SMTP id
 71dfb90a1353d-52f2c5ab85emr8028797e0c.11.1748295134606; Mon, 26 May 2025
 14:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com> <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
In-Reply-To: <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 15:32:03 -0600
X-Gm-Features: AX0GCFv9rmZ8vY8FFbnP0lrSecl40feRLs3yqUdAEeCO8w03J4KjSgCY4nGuva0
Message-ID: <CADvTj4oqjCkMeK0p8ZBa8PQmctc77hpiFK2pqgBJaxRFDgQoDQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 1:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +        phy-mode =3D "rgmii";
>
> Does the PCB have extra long clock lines?

I'm not sure, it's a copackaged(maybe on-die is the wrong terminology)
PHY I think so I assume the clock lines are internal, in the device specifi=
c
dts we set something like this on the emac1 node:
allwinner,rx-delay-ps =3D <3100>;
allwinner,tx-delay-ps =3D <700>;

There's some more info here on the AC300:
https://lore.kernel.org/lkml/20200416185758.1388148-1-jernej.skrabec@siol.n=
et/

>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
>         Andrew
