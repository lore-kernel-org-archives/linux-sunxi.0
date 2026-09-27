Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4F29D26E
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 23:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550952; cv=pass; b=VGzx6UbnTdzXU6dLE/1CfH/35+kJty4t0sW6U5eGNCItB2LMU63TDM0RJUVkwxKb8wLl4ijksbT8ep6DwdOjCcc5vpH1xfe2Gnm6n3pRZivoyTQLzxKKUTrucSfyPjtheCkjuPn6uocNu+2YKzTSc+oxg8CpR59a+xI8U+ahX+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550952; c=relaxed/simple;
	bh=Ou3b3cWlbHbJ+7kgTjQuk4/2d8eoHkAAMLMLbj2Apo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8Tk4jMOfgOHbiRicSUQ5xdLbgQwUKBdqSSGlR+qnjgC1LTNf/1xxz/q6vOaSIzjIN6PxZzZyyLkakNACudmTTRCyGEE3z7I4PR5FmQ57+u6dpLna4S6mS27ijNCYJXWQV6bh0EGBXmCsRnmS+yLcDLB3ecnU+snmGnU7CM0D18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCR2xiZX; arc=pass smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCR2xiZX"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5ccfbaf6da8so571070e0c.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 16:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790550950; cv=none;
        d=google.com; s=arc-20260327;
        b=Zq5hZbY5BxWslx2rSKaPCjP5o38HB6zdedKDyY/WNq5nvSK9P6+QzAGDZ8BHb5RlWr
         KuEeE5/kAHekgFs/On9CRoTsK1OeB+sqXc7TvZDOSMs0Qm+3gJtTCVCOjQDbOAEDH84P
         hWrQeDuE5Vyr/ekt3Rpc0ZuD+k/hvpAsOhp5t81SoRZK5BCFE3MlrLW3ERLPU9y9LJ2j
         CEHU7lBvDJGPG5bwcRzrJqo92NGMtF0nWiFIwZaD5eZaokQca5lFNz6eTtrE+5fAL4Tj
         /QpQA7+KiXMLtyBffoAxneHeS4NGHk52pGvbjt77E+X2eF4FsjKdwDbUxBph2P3TTdxK
         YoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ou3b3cWlbHbJ+7kgTjQuk4/2d8eoHkAAMLMLbj2Apo4=;
        fh=ncoTePvAaRsNiVNBpOYBEiNlFBN7Us1JYkp5mANYmdk=;
        b=cJvVjDkKkqg+SLZBQ3G3If58t9t8FA/JJ6CZu0sL4c2coBU5zt7eGljlL+pfjD2reH
         skCpKohQA1ziW7r4VXIcBYZ9mPfZrQ8PKzVslErHoOlG/wiNC8BlRBQ78PHYeLY7r1ZU
         hbzuNMYlt7AzwFroSj1FaMN08SchY78lnC8jfEOrXmEwVZI3uZNaUqEgExA7jrCv+K7V
         7SbmNiIQJ3JplwKn/2mcIywstuL3CqWdyIsCO/fo404Y54UaHw+3Ao2FMwbz9e7eibwr
         Wd6iBpOy1yaLFJLmJyLBFQVCzPyolTPf8X5hNmaIEZALSJDJWD/TWIp84+GxDaey6cvm
         rNiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790550950; x=1791155750; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ou3b3cWlbHbJ+7kgTjQuk4/2d8eoHkAAMLMLbj2Apo4=;
        b=JCR2xiZX3iF7ywTR0kz2tw5OLj76C8ec4gKn6nxbsP2PbpErlMHyYZivxrX+hpJkd/
         AEkDIFl6NZLdj8iIldSFIsomLrKiCILlyypPSpTeAuT6J2fulnxrHqq6bt86z+MEX8Y2
         zY2YD9tx0AvLfVec/1mDovOem/jsIa7pxfVjnNjLeuzZH2Gfuj0ys34Eie2aJ9ei29y4
         CAWoB37LgJDCBKx530nxA2WBRSglZw0JMVxruHjMpwgUTJHTB/YG1IOGbB9ESwaira+3
         QWptNBipYWs15vPP75JN0XSuhM5ybx/jY88abec6k7hiUGF6OF/tpbdbmmK3P7Vk0gO+
         nr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790550950; x=1791155750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ou3b3cWlbHbJ+7kgTjQuk4/2d8eoHkAAMLMLbj2Apo4=;
        b=s3XszVSqab0XP+n1yRwomBEYYmGz2TehUZFb1NrwOXlmrqJbrA/U4pKvx2nhoz/0Yv
         U6iWjMby/SH7eD+mB3Rq3gvLnv5z2qSJQU/NuvIRf11e76111hr9ZHO66FlkXflH8Rnf
         Qkt8la5MNbLRiubGj8b+22kQkKGfgKpt063tgLyK5qzO4fV6M3SNU1QZVNyYz7PE+fGv
         Rh8VWt3LRwGOMXTxZTUAnKFrOMCQtaJuyqi0NPl0FGcPpEVCXkwv+ol8ws/fvkkZG+Hg
         o+XYzWs3+jnX1TXmy0lcnd1Tjydk3scKRhyH+LT2gDhjS8nqq8V1gNn8jMLiztsyX7rl
         VUmA==
X-Forwarded-Encrypted: i=1; AKwUvBzGrEonqtZCGhmvj3lhulycI7zw8e8498KVPqapteLcvuP3jPKMskpXGzWwUvnZZctSSjL48pM2rVoKLg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIpbeCc4pe+uJR8nNuZhsmRWn0g34X2UmJhmRwsIfzXAhLN4Efv
	zSJGoGyXzXChg43juTz2KcUo81YWNForgegGhGlTmugEPcn6Y+R2WejvkNikbu5LnPZjTnrKgDX
	mqcrFvOffROsUUgr7DptiNaRgW/FZShw=
X-Gm-Gg: AYBFou1p2LPJAfXly4/BrqnbvnfwF0nFTqNce0ln4zT5UZyI084Rkfqw0M/vxFk6FRz
	RbeDRtz9B0McrkLwVM3ySk3gRs8mGUV+PuwuSiJ10PiB4OH3uok5JgVtX4BRPzmb3dr/vpG8ZFQ
	iswdqqsjUrgSnRxaWE+VAW9RHY9GKqrna4MJOWwhUa20CSzspI3uw7xsjIeW6qN/UswDPpyi0RM
	lL0vRWwYdff6ZLXKNdZJlzxRNbm0VtgD9V1MYi14d0oedQcHLMoZ+P7WEIjRNBXad/A/1otSVYh
	nDe6E6F86HrHdXNLikeo8TPbaUhYMqQ0TnCWfSDvtiCGGiRvzUcbNJi+HljJYLb3hQjsr+1aIo6
	ktOezm4ssf0q4OSXd9DVXQj1rrtbt0RYwHp9yR3yjlTkoLgVQukaRE+i+/bp9rmjuqw/qc2fmVF
	8PYZwr9u9wg0E87ZtIsCUotpPpfbgsDaP6GU/M+Y3iRfsW
X-Received: by 2002:a05:6102:1627:b0:7a5:673f:9a37 with SMTP id
 ada2fe7eead31-7af1eef5929mr3482037137.15.1790550949793; Sun, 27 Sep 2026
 16:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
 <20260927151043.7c8dfb36@kernel.org>
In-Reply-To: <20260927151043.7c8dfb36@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 17:15:38 -0600
X-Gm-Features: AclHuK_THxkPfcffLWRyKYWHUWs5mZ9sx2wsFti5QobsyH-hd7-eV_3I5VuXwpA
Message-ID: <CADvTj4pZpJBAa99F322jBetg96axu_Dbv-iKAWwhOUqe==EE1A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/19] net: stmmac: preserve datapath state
 across MTU and resume failures
To: Jakub Kicinski <kuba@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Serge Semin <fancer.lancer@gmail.com>, Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
	Richard Cochran <richardcochran@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Ong Boon Leong <boon.leong.ong@intel.com>, 
	Voon Weifeng <weifeng.voon@intel.com>, "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
	Linus Walleij <linusw@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, Yao Zi <me@ziyao.cc>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	"Alastair D'Silva" <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	ZhaoJinming <zhaojinming@uniontech.com>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Ding Hui <dinghui1111@163.com>, 
	Linkui Xiao <xiaolinkui@kylinos.cn>, Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Rayagond Kokatanur <rayagond@vayavyalabs.com>, 
	Ding Hui <dinghui@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 4:10=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 27 Sep 2026 15:59:35 -0600 James Hilliard wrote:
> > Keep the stmmac datapath coherent after failed MTU changes or hardware
> > resume without changing the interface's administrative state. Retain th=
e
> > working MTU configuration for rollback, and allow ordinary down/up
> > recovery when hardware cannot be restored.
>
> Please read:
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
>
> The limit is 15 patches per tree, you have 22 outstanding to
> net-next right now.

Oh, I had bundled some prerequisite patches to avoid breaking the review
bot since my fix for prerequisite handling for the review bot doesn't appea=
r
to be live quite yet(it was merged but the live server looks to be on an ol=
der
tag still).

https://github.com/sashiko-dev/sashiko/pull/389

That just got merged so that shouldn't be an issue going forwards as I
assume it should go live soon.

This was originally on the net tree but I had switched to net-next since
some additional prerequisite commits were only in net-next and I was
trying to avoid conflicts or having to bundle the patches to avoid breaking
the review bot.

https://lore.kernel.org/all/8ed1298a-4c29-4db3-b76e-c8d34f91b4c9@bootlin.co=
m/

I guess I could move this back to net and specify the prerequisites with b4
metadata. It isn't entirely clear to me which branch is appropriate for thi=
s
however.
