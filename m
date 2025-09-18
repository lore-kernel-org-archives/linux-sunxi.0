Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F52D73A7
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Sep 2025 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758178223; cv=none; b=bqTJNHuMq72HRHDR42UEETxVaixu08ODAHvCKpkx4W8vPjiH5UrOb4Dk4q7xTH2K604OE41dgzGTu9YbcxQIw6HizBoxTB4e3yh5oMr1o7ntLMJO7qJdETLXt87KpOg/zz3sCd6XbZJttsemKzlgD4eLS4NGuZ3JeLcC40mZqY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758178223; c=relaxed/simple;
	bh=E61AklOCat9VCLqMef8JiiENaQpUakUCY+88tvDoJDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WPHFZLq/SEf6euXTl2OUI+76fE52qp2f/MWX4cb5lUTEf4aLgwC7tDU5aT12B9jjCU8OzOnkBdpbqvAkRHg/vsj4bPFzBZ1It20fw7AJ02bY8MF+W1pDkhF16BSA7jECzHCfs1IxBJnO0q/SCptEo9R2zcD2UBkPTsdmA1b2kC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.213.2])
	by smtp.qiye.163.com (Hmail) with ESMTP id 233a88a56;
	Thu, 18 Sep 2025 14:50:15 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: wens@kernel.org
Cc: amadeus@jmu.edu.cn,
	andre.przywara@arm.com,
	andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	jernej@kernel.org,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	samuel@sholland.org
Subject: Re: [PATCH net-next v6 2/6] net: stmmac: Add support for Allwinner A523 GMAC200
Date: Thu, 18 Sep 2025 14:50:06 +0800
Message-Id: <20250918065006.476860-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAGb2v640r+TwB7O+UAB9PehZ2FaXDjhVerK6j_CZ2+caJoJ9zA@mail.gmail.com>
References: <CAGb2v640r+TwB7O+UAB9PehZ2FaXDjhVerK6j_CZ2+caJoJ9zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a995b96860203a2kunmec52b10073125
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGktDVh4dGEJPThlOThkYTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJWVdZFhoPEhUdFFlBWU9LSFVKS0lIQkhCVUpLS1VKQk
	tLWQY+

Hi,

> I don't have 802.1q enabled so I didn't see this.
>
> Can you provide the base commit you applied the patches to?

Based on the latest linux-next, 20250917
with these enabled configurations:

CONFIG_IPV6=y
CONFIG_STP=y
CONFIG_GARP=y
CONFIG_MRP=y
CONFIG_BRIDGE=y
CONFIG_VLAN_8021Q=y
CONFIG_STMMAC_ETH=y
CONFIG_STMMAC_PLATFORM=y
CONFIG_DWMAC_SUN8I=y
CONFIG_DWMAC_SUN55I=y
CONFIG_PCS_XPCS=y

[   38.818801] 8021q: adding VLAN 0 to HW filter on device eth1

When the interface is down:
~ # ifconfig eth1 down
[   69.181869] dwmac-sun55i 4510000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
[   69.189827] dwmac-sun55i 4510000.ethernet eth1: failed to kill vid 0081/0

Thanks,
Chukun
