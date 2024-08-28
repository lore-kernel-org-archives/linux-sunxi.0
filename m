Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2F178364
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Aug 2024 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849430; cv=none; b=TtMvEAl9iBx8SdROHvO+SHtQ8q2QZ6BrOP8T42B0q09LUH/vkLSKSq0XBRoTGylOZsPZwGB/YdzdJxP52sxIeWwr8GJCIp8Xhu1Lp+kGunsDhYT4ZxjFnLOC60mxjcV2P/ubc8k/UO4UPEyhGX0fNrZKrALjuW0Eo5/5Nn9WAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849430; c=relaxed/simple;
	bh=ZziwDkHVvvQUO6Ix148uGBxsk3bDYW0cw5kn9BpbUzc=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YA191fAja+szGikgDSt9kjPlPazXR4aWcb4SnhOjt7F3VtVwx5W0WD6INlXA3f1k8+2SYZMXhTlFCNAtWyk6M3eKDjCiZmsJhX2Vy+PxJblKFRrN526GvAlwXxsBnrnWXj9FL2ANWm1/up+bwekO/G6apicVIQkcQZPy9xE7lyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wv41T1pbfz6H7XM;
	Wed, 28 Aug 2024 20:47:09 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A5EA1400D4;
	Wed, 28 Aug 2024 20:50:25 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 13:50:24 +0100
Date: Wed, 28 Aug 2024 13:50:23 +0100
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
Subject: Re: [PATCH net-next v2 10/13] net: dsa: microchip: Use scoped
 function to simplfy code
Message-ID: <20240828135023.00006db0@Huawei.com>
In-Reply-To: <20240828032343.1218749-11-ruanjinjie@huawei.com>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
	<20240828032343.1218749-11-ruanjinjie@huawei.com>
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

On Wed, 28 Aug 2024 11:23:40 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop by using for_each_available_child_of_node_scoped().
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

