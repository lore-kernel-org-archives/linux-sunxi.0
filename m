Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D375835950
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Jun 2025 01:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382860; cv=none; b=r2V8krgGpWd5zM+ukes9Zdj87VERNTRsbdFMshTqhlrk4cd0qahvNZGiKVxVXaycSUNForwMFGBTXLRSwmMvgelaD9RN+06HNXJKY8zkYCRFj66RFoZWiApO9NT29NasIHCcuQkAGPRiaF7atr/+wAjqDF0OVSAwAjjUIt7rLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382860; c=relaxed/simple;
	bh=jRrcd3jIEsF31VWDqmff6c9MGZTpyAF3UKfV3oVeAUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RJr1e8RAVKynOxoxoF1KTyGiJSDkre/YlRbT6XJFuad5VWRty3WOzdxi+vz26ljjOxRtABzssiW5UJXOrq6SWcgYGrQG2va50VUZiuDXjfg6lY2hFCW8L/gSWVvHOik+8k100worZAmSHYDtNjHmoX2MWwCxwXuK0y9epJJeogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NoZcchrT; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NoZcchrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ie
	mo//66rGggfhMsVrvcGWLgvsP6AIerLHEFJXsGHqE=; b=NoZcchrTVa7ylagmGp
	10DCENAV5t5AdQUraRYv0/832vC7XNiZLVYGPoJNFCx2mHGwgy4k6o7BdgByZCe7
	Y5GUcT1qcydPv87OTVOqXMhRIbP3r/51fL7637uWfl4V/ZCwY1ezkqurkJOmuyLq
	2xxTEmb0EiyjiM8bch+IEEe4Q=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCX4izzuFRoCzlJAg--.49566S2;
	Fri, 20 Jun 2025 09:27:15 +0800 (CST)
From: Yuan Chen <chenyuan_fl@163.com>
To: linus.walleij@linaro.org,
	wens@csie.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenyuan_fl@163.com,
	Yuan Chen <chenyuan@kylinos.cn>
Subject: [PATH v2] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
Date: Fri, 20 Jun 2025 09:27:08 +0800
Message-Id: <20250620012708.16709-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250620010345.11247-1-chenyuan_fl@163.com>
References: <20250620010345.11247-1-chenyuan_fl@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCX4izzuFRoCzlJAg--.49566S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw45KF45JF17Xr1UJw45GFg_yoW8Xryfpa
	1fGry5Ar4rJF4Sg3y3A398WFy3Gan7JrW5G3Wj934Yvrn8Arn5XF15KFWjyw4DCrWrXr1S
	vF4DA3429F1DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEAR6UUUUUU=
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiJxJyvWhUsxR6wQABsb

From: Yuan Chen <chenyuan@kylinos.cn>

In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinctrl_map
array, the function returns -ENOMEM directly without freeing the previously
allocated *map buffer. This results in a memory leak of the original kmalloc_array
allocation.

Fixes: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf8612d72daa..d63859a2a64e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -408,6 +408,7 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	const char *function, *pin_prop;
 	const char *group;
 	int ret, npins, nmaps, configlen = 0, i = 0;
+	struct pinctrl_map *new_map;
 
 	*map = NULL;
 	*num_maps = 0;
@@ -482,9 +483,13 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	 * We know have the number of maps we need, we can resize our
 	 * map array
 	 */
-	*map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
-	if (!*map)
-		return -ENOMEM;
+	new_map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
+	if (!new_map) {
+		ret = -ENOMEM;
+		goto err_free_map;
+	}
+
+	*map = new_map;
 
 	return 0;
 
-- 
2.25.1

