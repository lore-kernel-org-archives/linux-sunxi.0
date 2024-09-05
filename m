Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1B19D08A
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552138; cv=none; b=q9aJBJZVzLprAQTjaekYRZp1uKyMAE+RP9Fldu5UDZDrwzdEIGNHU1dZvzVt8ZajL3ubG5qs01JGD9tbSxhXncyJz/4nZbR163UmMEgAlVteB3eqIaG2s1KJGMX/QT8pOIC36+0lTSuVw0ltOL1MdyteZ22zTx8QVJrHy9BKpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552138; c=relaxed/simple;
	bh=DDvGNXN1dLU6yyW7OVEdOjq/nHiOwrSTMqw1AFdhHpw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hSmNS/KzMWj5cCMLMHKFojM1QyuNnrsDZVrv9nuoLjDg1HAw2psSdSiA7QMbSVbEocw6DhUKSyzCJGK+Uclianb0bhnprqhL0ST8kSVcpKivtK7tEydbGKgxxaL33Rn7rACz/+cxMuBPnW3ePSzbLoIAJIaW7uhNOiij9qm1hS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3251BC4CEC3;
	Thu,  5 Sep 2024 16:02:18 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B79F15FA8D;
	Fri,  6 Sep 2024 00:02:15 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: jernej.skrabec@gmail.com, samuel@sholland.org, 
 linux-sunxi@lists.linux.dev, Zhang Zekun <zhangzekun11@huawei.com>
In-Reply-To: <20240905114134.80310-1-zhangzekun11@huawei.com>
References: <20240905114134.80310-1-zhangzekun11@huawei.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Simplify code with dev_err_probe()
Message-Id: <172555213572.1896952.10233826837045457508.b4-ty@csie.org>
Date: Fri, 06 Sep 2024 00:02:15 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 05 Sep 2024 19:41:34 +0800, Zhang Zekun wrote:
> Use dev_err_probe() directly in the driver probe phase. This can
> simplify the code a bit.
> 
> 

Applied to sunxi/drivers-for-6.12 in sunxi/linux.git, thanks!

[1/1] bus: sunxi-rsb: Simplify code with dev_err_probe()
      https://git.kernel.org/sunxi/linux/c/7ad250e13ff8

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

