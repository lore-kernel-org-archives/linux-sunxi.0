Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C916C69B
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Aug 2024 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848733; cv=none; b=buBierwjSiNn2ZMBBwJhKcWOTbBKQuN0iVVSd7pMPx+OxOYe/BDbsvzoKM3nahk5AIPKknNkNGBIaNbkbloU5vBPJ5P85X+foKyvwjwcZledt8goKKqwTYj8X0PREbFpV0IN25SrQCCTtWawCDK5GSsVyqI9EIVck3LidQs3yA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848733; c=relaxed/simple;
	bh=Kb42ny4JQIEMx/QzK5RnzyL5pG52Hi2BMThbTfxIaEM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VLf3MCvkvVrQ+HfhLcAg4FS16T4aHsl9HT/NwQmopOsSjg/gxdfC1Hz9hcXEX0iRehAF7uWDKoRe4Dofo7WADEoDsmdHXacajM7I61g7uJJ4Uka9o2iOWBEEfLWGqBOyAthYb+swLqgHzuQwXNyCcWL3V8x3QEtWQb6kWfDuDQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wv3m35lmWz6K993;
	Wed, 28 Aug 2024 20:35:31 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 165B714038F;
	Wed, 28 Aug 2024 20:38:50 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 13:38:49 +0100
Date: Wed, 28 Aug 2024 13:38:48 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
CC: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
	<alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
	<sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
	<joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <ansuelsmth@gmail.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
	<jic23@kernel.org>
Subject: Re: [PATCH net-next v2 02/13] net: stmmac: dwmac-sun8i: Use
 __free() to simplify code
Message-ID: <20240828133848.00006fe2@Huawei.com>
In-Reply-To: <20240828032343.1218749-3-ruanjinjie@huawei.com>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
	<20240828032343.1218749-3-ruanjinjie@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Wed, 28 Aug 2024 11:23:32 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Avoid need to manually handle of_node_put() by using __free(), which
> can simplfy code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
