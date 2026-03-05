Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94337EFF6
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704943; cv=none; b=RsUD1xVNBeEa0eTDEZ2LRiR/+QQcgCzPzVZwhpxwN5u4UogVKRlzEVp414Ju5nIlJduwAwQ4VfzCeM8LauV5VcJYx6pNdWZX2dQivEyv2bEQinv29p3tENAFpWDw/jaJHB+Nmli4HOjWclv1ncpdini9DDiyg63Lf68aeyARP2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704943; c=relaxed/simple;
	bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qs8DZSKl9AcGifDwFOiz37rcfRsuTiwc6x4typyGeYD3fNXwgUNA8wgkcd9oy3p0dyhu86Kb1SBra6s7gKImeyzScnmyRoC0NT4R0cEQK71ijQE7h55tkKojESVyuG5d9wcdY0kq5B7a1yGiTElFssjq+VRm5y/7ebFR/He0kuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRAKJSXV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRAKJSXV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48371bb515eso116816445e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Mar 2026 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772704940; x=1773309740; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=cRAKJSXV3rRGq6ApXGxamK2sBKFK8d/YER2e7OWrJWx8Qq82qFqbckr0zNlJru7qn2
         1X5PCVCZdwJtnIOZAyNc8hrCAbClCd03peDLriMPUqFoWXM3bjaBjKpXYOawtucqrv2r
         NAvsAjGF5h3ep/oKpyznqo3ZeesceBcbEJwZmZIzz5Hdb5us8ZUCZ6ezKnrFSlRlYNH0
         5G9m4zhNQJyVz0moPEQi9bi+yd7UFgLX1ySPw26rLTrxnVYf/OuJzTHmKbWuyYGPD3XI
         wYxH3Itw/XESA9KvTs7WICu38Fx7o+RF3P1ujBSmsEpT/D8vsrsXclONA0C6QlVaw+Cp
         Si9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704940; x=1773309740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=f8Pvvp5/P55Yd3dlvM5A7oXG0XGlOaU7zb8ZImHxx/q4XbtZDCBsPfNaheiMwCbIKh
         A+16sVWyNFPpXPvKSTv21d/Srhf5etf5Yt2oIuwQf+Bfc+RYgW6Y58KgDPxeDk+AbYWR
         xpffo4HUjTyRtpXqBNMsC70qpgJWfjNMDy3OpzL48hvCfu01/4xf6krdGmXNGSh6QCUG
         AI+2HhKM57p9+oaAjvQejxH/z+Bg26u2yIcmVKceLlbuT770Mq+yimqFk+d9+ZNZtqY8
         qF7lbUogv2Ta3ZoC44QMx/M7yZ67fXd+HPpHIa32u06B8boLCtmc/nm6k37SQHD2qT2C
         gZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCWgYF2m6eKdroiOJ/0LIQpxQsBTbXlhm0CDFo9rXPXW3Qx3qMt1p1uT/P9mSA1n2PFVuJovP7a9n+f5mA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQE/z24LSlgbgOgX2A3TFpJkYyA3+bSyr8NWgwOeBsy5RpgrUt
	2gR2BV9+Nw1hWLkV04hPd+/HjfFN0GwU3mveaJvhCijJxUMVqD+WGubhMjp6QE5Tylw=
X-Gm-Gg: ATEYQzyiLo9fj0YuGwt3yxv6AykGK+F+bJrVQVtNJakK7BAILmuxK91s+h18z+BPrTF
	FZi4HtIUCG75vucVUHFU5sEtMinrnAcj4ItNrT7FLkRN87RlF1353ukuowv/KDTY5b+oqOHE+Bs
	BmbPGTjqUA3NNRZ7OncXEmf22Y5Kfqprj9TQ+GDMckk/wvr/eZVehGcHcRDPVLJ/t4waoX4LDxF
	t1syqavGah+yAn+uxsCZG16L8nTo0PvSMZ1H4MU8FtJoaDtexPKjesa0yfgCGgcKW22v4HD2zc+
	DLTpxI1QWYsfgYBsOkr6us5aGhWv8LN09mQJpcHhjacYyOe9fkgrd2xJUyNba5bCVoSuIftTxSU
	eCmC+XD0sUJ5Qv0/TbXnGloNqLQRph1oCPwWnj5rWdmT9e+T+yWWqNGQVf7Y1jEQO7OdktlZEhR
	kiepopERgmQQZfF+m7LDcmi26pQOys
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4851988f31dmr86977045e9.23.1772704939633;
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Received: from salami.lan ([212.129.84.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fade9fdsm59453655e9.4.2026.03.05.02.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Message-ID: <030737fd255a49288349f06e8c1217a126ea9081.camel@linaro.org>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where
 missing
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Peter Griffin	 <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>
Date: Thu, 05 Mar 2026 10:02:16 +0000
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
	 <20260304175735.2660419-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-03-04 at 19:57 +0200, Vladimir Oltean wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>=20
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

> =C2=A0drivers/phy/phy-google-usb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +

For Google:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
