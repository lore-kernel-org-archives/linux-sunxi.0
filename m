Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A69E7B
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 09:23:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id E5E6F3200915;
	Mon,  9 May 2022 05:23:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 09 May 2022 05:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1652088189; x=
	1652174589; bh=Ry+sG7AeUuuSUyeaD2CqDfW56d5oAW3SwnbrciZOPu8=; b=b
	dkILA9FZ2V2Of/AuvGmRShHZ8HV0pudACEbHev17TrYQVZIL2zudheJnxnVvuXY1
	GDtkOfAYt3C+X5PCgZs5qCrejhkhf+d3Ovmfi067Tos61i8k6blm4XLsj43abDOS
	ChWFqcoJNjBzXD03QIYPmPemAOmjICwSg7WenPGkcWZ91egni2UC0g4hRCI+yfkk
	mt1aVRQisb5sV7j1HYAlVfkzjjeYcsz/mh+d2QIE8YxdDnIwmPOcDocJrv0i/gng
	w7lnWzCD59uotp8ewhX5ZIfJB19NE6MPnakXoyqt6dZwXn+aVhSwDQVPmSgFT0wx
	BmJJ7r421yIZB3SZSSM4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652088189; x=1652174589; bh=Ry+sG7AeUuuSU
	yeaD2CqDfW56d5oAW3SwnbrciZOPu8=; b=T2Ij/FDU1n1eCko98Av+rvmtnY2kG
	N3Pbb/B0+04qsCq0L1whc7KLszmTQDeLv9yeNo5Q4E2qIry1QhiU/lbHns1zAt7L
	IwRy5oxXDeCpYWg6cWnZpbPl1zG7PbwJeqfS8kRuCqjusGeci7PLZ/9w1cS5c8Ql
	5lOP5aWb5Dhjd8WgnexuaCjXQ3ZQuJm/GeDP5J0n3u7I4QE9CS3gFwyueY1JTv5V
	GkitRW7rmYZrUVoCAeiJnHAHdwTw/urAj32z2VEjC+n113ldhbqKZtwsDrt529aW
	NSmwbY9o0rain9KTuRcn136U8SqsEKEoxRTT2/b+ArHn0LkTD9ag78L9w==
X-ME-Sender: <xms:fd14YuKh5KxGK6GvdRXY_15ewX9BbTykIyUFFhXDGjViEB8ARyjwQA>
    <xme:fd14YmIVGIfd3Rh6uzGtmsjxTICWV66k-skXiLYgj5B-BbTGz057XEA7XNOqBzd0B
    NoBcnIOCeQfws8R1vU>
X-ME-Received: <xmr:fd14Yut-L9KwQkkgp_UzG2siIEz9w0SNxzicKwGkZWHppbHZFiQCiW30X0KY5EMRYXcVPrYgdCR-E6Ujri7t4HeChHnWv08OUi7ensg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
    teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fd14YjaYxzmOmOV5koXZ5qJFoj64d7iI-AaPJmeKAyZ0cF3Sk_F5Qg>
    <xmx:fd14YlYXyE6KaXrkoCJVcIDeNzdVToBvqKHz47YRk65sMQ76zeaCgQ>
    <xmx:fd14YvDPV-jU1B9NaFDHL0ZTp0pp7a31ghhh0XjXjKhNGP9n-9ZasQ>
    <xmx:fd14Ynkya5CXWwUIPy7ND0GIy_vPeS241DQ5hdRAjlP7fEGp3np8CQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 May 2022 05:23:08 -0400 (EDT)
Date: Mon, 9 May 2022 11:23:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qianfanguijin@163.com, linux-sunxi@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1] drivers: cpufreq: sun8i-r40: Add cpufreq support
Message-ID: <20220509092306.22ttfunrislztbvh@houat>
References: <20220509084853.17068-1-qianfanguijin@163.com>
 <20220509091125.tps3zwaq276jlgh3@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220509091125.tps3zwaq276jlgh3@vireshk-i7>

Hi,

On Mon, May 09, 2022 at 02:41:25PM +0530, Viresh Kumar wrote:
> On 09-05-22, 16:48, qianfanguijin@163.com wrote:
> > From: qianfan Zhao <qianfanguijin@163.com>
> >=20
> > OPP table value is get from allwinner lichee 3.10 kernel.
> >=20
> > Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> > ---
> >  arch/arm/boot/dts/sun8i-r40.dtsi     | 47 ++++++++++++++++++++++++++++
> >  drivers/cpufreq/cpufreq-dt-platdev.c |  1 +
> >  2 files changed, 48 insertions(+)
>=20
> Applied. Thanks.

Shouldn't you wait for the maintainers feedback for the DT bits at least?

Maxime
