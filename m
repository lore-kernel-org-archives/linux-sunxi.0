Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44324425862
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377844; cv=none; b=YIqXxIDhqYo/FBiyXE7FMY/ago/Eif1r4eNr9jSNEfI0ddugP9UK+dcIjVjNKCjEk9THwcjod4Ns0yNsgcntKV6em2cvnPaQDOXUwKJMW66JRSv3FsmF35TieBkU+4m1R7JQxJExWfAv0Mc6BYV/jaFNWoO4I8Gb0SlFDnmManA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377844; c=relaxed/simple;
	bh=PJCpttXgaFTAAuIppNV/gcSz4Kqn62rNZomfMgasjmI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vvh9maVs0RXQImnxSiV0Jn7mUmMnaOqDgXGE6qVpGI2sLgpsGzLkDlsDjPRRxFo1SRmbbRJdxU0imazGS3UfzhDD29Xhuvq8DxKoVuI7/cPWF07a5u4/bEMxIAqbmvFO/yHH8g3+E4icFqZgXtJSkc2C9W88EYJ1MEURAHBedwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S03B2mRD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S03B2mRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789377837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
	b=S03B2mRDhMOL9hadIcjxq84aJy8x2b9D+LQRphsfR0PdxlSCwtWsvengupFKEESvc1Vm48
	I8ruJN69aaAnU2kVZpNcR43EyW1fQVn3HoCQ5L+YIzEkzrMhFUfviLS2Oe8+EcUgt3hZ3G
	77M7sQNZfEwjFDdRQNiorKBilPwieko=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-A_lNohiVPW-n_8Q3I4oY8g-1; Mon, 14 Sep 2026 05:23:56 -0400
X-MC-Unique: A_lNohiVPW-n_8Q3I4oY8g-1
X-Mimecast-MFC-AGG-ID: A_lNohiVPW-n_8Q3I4oY8g_1789377835
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso24912825e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 02:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377835; x=1789982635;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tb/KsUxM9jxkMjSRJHpE7KiQY8ZPLkB6sQ8Hi6kwrEk=;
        b=aFphFQC7Biiwa9k+0KIKBxt3dBH1t1h3iC0kxVXXTsyxcIMaNy7ewFeoIiLj331tZI
         cgGz1IPRpbrK9BMG/AkqOQrhhgi8Si8voDd3TCgD0mGty1mCM+wzlqIn6yPNaLcpBB8w
         9X95CNv0tX3D1mreEwVwPf17NeNuy/5Ch0ugENcVy6CapKc09xd9LJT/Ea349m8iEFXg
         h9VG1+tNhbWauINkTr4rik9F0GgnYRKhPQDvgiCJZVsA4Ni1SOgqIdFawepsKChelCLo
         OTaF/c8dOWyJM945S5tIsmbqdh5Dp+bhyc4ETSTZTwxe4tiMWQUaGcSilU3KOTzrYf3P
         /G5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzsJdKA2YvbYuZSfjdRdmbzidg+bJehmZKZuHzHaLun9HneC0XzkGZ3C3NzU76mLAqfL03QKoOnKQhMPg==@lists.linux.dev
X-Gm-Message-State: AFuF++lgIMp6m9WelcSrCoMdBwiK43BfSCCsdjC/MY0wQXklVK5LuxGW
	s+3uRn10Jcuy2v01cW54d0/tsUQWdyhdNdHVawBEW0Xs/pbyTxuARG/2Ch7gWgGXT0PjYF01oPd
	t+GDJ+RkgpQxHhREtZLnE4UIwjgMoeqArNZNIbYohzlmWhvkUlFa0dWlROnWQvxVy
X-Gm-Gg: AYBFou25//DwILERbmv/CYfMHjMmUtm6aydqU2By5kZNnuAa+HVC+RET4njLIb4t3FA
	lctCQGix6NvJl4MDu8vSdx5PdSsgy+Zil23XQ6TTjGSbr3LeSFm0wtrk05Pgy88wpn+0NoZj+/u
	1TQapdl/Hc0IEfZ1kwNxNxaS1ZmRHSuhrzOC05DCwdgD86L7sO7EByVZgMRSrPjNFPgtikbP+5a
	3rE9CUGek1VnwZNAAdFEoTZqlDtuSVTBm21uxxQopwFG1WBy165vpD+hEpzBGDxGdMOrR14Vb6k
	GolMLLF1Na8IyJUOb56RF6WsPny3IeGIgQnwhna4WANZakazRhJjYeibV7A8vZuHdyFUtVSTOlE
	XVBpkK4dcURkd+qQ4MzJip7bmVIygc7LJ71U38GKFN22puHIixfQJ7KCxUg==
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr16858185e9.21.1789377835324;
        Mon, 14 Sep 2026 02:23:55 -0700 (PDT)
X-Received: by 2002:a05:600c:628f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49e7a66ae3dmr16857405e9.21.1789377834915;
        Mon, 14 Sep 2026 02:23:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm399519375e9.2.2026.09.14.02.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:23:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Chen-Yu Tsai
 <wens@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Liu Ying
 <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Philipp Zabel
 <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob
 Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Yongxing Mou
 <yongxing.mou@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, Chris
 Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Use consistent indentation in
 the example
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:23:52 +0200
Message-ID: <87pkyg1907.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YjaQm7lSwcl4bsxMja-pDgObKOFHU4o5avgBuFWiEFA_1789377835
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

