Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E432FB0
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 01:51:24 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210525014213epoutp04098b0f4e524f05b05956856d11c7dbf9~CK8NcKrdd2603326033epoutp04N
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 01:42:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210525014213epoutp04098b0f4e524f05b05956856d11c7dbf9~CK8NcKrdd2603326033epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1621906933;
	bh=XUlWc4spdDSuHY4nuuOfJQRSkMKhUn7WZFb53aJnEmg=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=BsUoC5hYurLBH0CVdAS6POamPCxjyrDI6AkbpliZgh3JdAX2CdlfamCjnqxdraBSp
	 lrhMQ1/7xa3JKBdUXmYBfzWzcKTNfQPNkFHROm2nfPOqtEmcH4Ei8wDDZpu2Pe/ym7
	 RBS9yh8ZHixtp/MAi/aogjqnfnTKOkil/y4Cc4tY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20210525014213epcas1p21bf99b9152a61573ea9f743c911dfccf~CK8NNblEf1289812898epcas1p2s;
	Tue, 25 May 2021 01:42:13 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.154]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Fpxdt0KPzz4x9Q9; Tue, 25 May
	2021 01:42:10 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	D7.7F.09701.0F55CA06; Tue, 25 May 2021 10:42:08 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20210525014208epcas1p27b70b7d2e9408b35253acece46d5b892~CK8IlbLfS1062710627epcas1p2p;
	Tue, 25 May 2021 01:42:08 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20210525014208epsmtrp12a3395a5c34ae92d868aa4e0807f3414~CK8Ikm9qG1715417154epsmtrp1B;
	Tue, 25 May 2021 01:42:08 +0000 (GMT)
X-AuditID: b6c32a36-647ff700000025e5-03-60ac55f0ca44
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	BA.04.08163.0F55CA06; Tue, 25 May 2021 10:42:08 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20210525014208epsmtip182d937483eea1e3699c678c413a8cc6c~CK8IT0dqZ0353503535epsmtip15;
	Tue, 25 May 2021 01:42:08 +0000 (GMT)
Subject: Re: [PATCH 2/8] mmc: sunxi: Fix warnings with CONFIG_PHYS_64BIT
To: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
	<jagan@amarulasolutions.com>, Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
	Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <94eec980-2654-3cfb-90c6-96d3b195f7bd@samsung.com>
Date: Tue, 25 May 2021 10:43:02 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210524233029.16417-3-andre.przywara@arm.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmvu6H0DUJBmeeWFqsmPeT0eLLpgls
	Fs/nr2O0mLJvF5vFx58nGS1+rPrCavH8USebxdu9newOHB5rP95n9Vgzbw2jx85Zd9k9zt7Z
	wejxYvNMRo83XZPZPTa+28Hk8errXMYAjqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwND
	XUNLC3MlhbzE3FRbJRefAF23zByg25QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5
	BZYFesWJucWleel6yfm5VoYGBkamQIUJ2RmbV7xgKjjNXbH90UT2BsbVnF2MnBwSAiYSHzv2
	s3QxcnEICexglPj/fS0zhPOJUeJJ00ZGCOczo8SnxQ3MMC2XPnxghUjsYpT4/O0PG0hCSOA9
	o8TdKYUgtrCAh0TH36dgcRGBYomjt7+D7WAWWMso0XpoLRNIgk1AR2L7t+NgNq+AncSBz5vA
	bBYBVYm33d2sILaoQKTEzqcv2SFqBCVOznwCNIiDg1PARuLAizyQMLOAuMStJ/OZIGx5ie1v
	54C9ICGwhUPi2aOljBBXu0hcfHGWHcIWlnh1fAuULSXxsr8Nyq6W2NV8Bqq5g1Hi1rYmJoiE
	scT+pZOZQBYzC2hKrN+lDxFWlNj5ey4jxGI+iXdfe1hBSiQEeCU62oQgSlQkLr1+yQSz6u6T
	/6wQtofEh+lv2SYwKs5C8tksJO/MQvLOLITFCxhZVjGKpRYU56anFhsWGCHH9iZGcLrVMtvB
	OOntB71DjEwcjIcYJTiYlUR4//atTBDiTUmsrEotyo8vKs1JLT7EaAoM64nMUqLJ+cCEn1cS
	b2hqZGxsbGFiaGZqaKgkzpvuXJ0gJJCeWJKanZpakFoE08fEwSnVwKTCd/9A/Kttfesud9oy
	+wmJrZO+cadtru/x3xMDfr9kn8BQ2Xdo9ReFnPNOCtvu37w2v81KdPpiMRvXk9KJrAszZ/rI
	XTbT5wwQ4OvwkWDW394oFcLov/biV9nw03f9Q7/Peb0y+/Cj3qUaTi93HMrfq8QUqKHSHHfI
	6OYe0bWO7M4RHLOkY3MW7lQM0Ur3N3rTF+X50OPFM74sNhcLK5aU/K2tp/weeoVuWzVF2MZ6
	qm6I9NG0c1v9Mo/vsAoztz3+aW/UXCfXhJ/zPx5R+PXxt87DEzOa+x5fW9m6IWrTRVs+RrbU
	e66zpveyPXo8Vev0VxmTJe8rsh3+y4Zo/Ym/nVWeKZCfoZ5zaeqj1UosxRmJhlrMRcWJAOTa
	svlABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42LZdlhJTvdD6JoEg3cv5SxWzPvJaPFl0wQ2
	i+fz1zFaTNm3i83i48+TjBY/Vn1htXj+qJPN4u3eTnYHDo+1H++zeqyZt4bRY+esu+weZ+/s
	YPR4sXkmo8ebrsnsHhvf7WDyePV1LmMARxSXTUpqTmZZapG+XQJXxuYVL5gKTnNXbH80kb2B
	cTVnFyMnh4SAicSlDx9Yuxi5OIQEdjBKLNi0ixkiISXx+elUti5GDiBbWOLw4WKImreMEidf
	fACrERbwkOj4+5QNxBYRKJa4/PU1C0gRs8BaRomZh7YzQ3QcZJT4dOciK0gVm4COxPZvx5lA
	bF4BO4kDnzeB2SwCqhJvu7tZQbaJCkRK7NxhCVEiKHFy5hMWkDCngI3EgRd5IGFmAXWJP/Mu
	MUPY4hK3nsxngrDlJba/ncM8gVFoFpLuWUhaZiFpmYWkZQEjyypGydSC4tz03GLDAqO81HK9
	4sTc4tK8dL3k/NxNjOD40tLawbhn1Qe9Q4xMHIyHGCU4mJVEeP/2rUwQ4k1JrKxKLcqPLyrN
	SS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1OqgUnN9E1bx5pFKhk7ex4LyXgL8J7a
	d3d7T6R3a5eJxMedD26X5M35cfp7g8dm48frr5jkbZsw4Y6zQMadUyq26WFN3xZY9N+b5z5V
	uPJYeeq8OYYVnMcmnlrM739EXCx4L/+q6jCZ9HU9VgoWXy4X+oU731fs1+PbaJG9KtvxSiy7
	odz0e8VdjZMqf2UvjH2Y/SpnStQxmVMq79qvy6/0vVF5Z52Uls05z833W43mFv4sSb/5fMn0
	i+84TteWXGg63tbs/q5Se9ovHZf3AVVax5pOZXp/mpbz+f3UwoBtk89qr5yrtnuuD0+UHaMZ
	k9wkc68sh8etp36VXLq0rXiSOuNK7Xapo79m1Oa/muWnxaXEUpyRaKjFXFScCABGpJNpHgMA
	AA==
X-CMS-MailID: 20210525014208epcas1p27b70b7d2e9408b35253acece46d5b892
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210524233134epcas1p4fc56319b3629c03484ba3319fed891d0
References: <20210524233029.16417-1-andre.przywara@arm.com>
	<CGME20210524233134epcas1p4fc56319b3629c03484ba3319fed891d0@epcas1p4.samsung.com>
	<20210524233029.16417-3-andre.przywara@arm.com>

On 5/25/21 8:30 AM, Andre Przywara wrote:
> When enabling PHYS_64BIT on 32-bit platforms, we get two warnings about
> pointer casts in sunxi_mmc.c. Those are related to MMIO addresses, which
> are always below 1GB on all Allwinner SoCs, so there is no problem with
> anything having more than 32 bits.
> 
> Add the proper casts to make it compile cleanly.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
>  drivers/mmc/sunxi_mmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 87b79fcf5ef..869af993d35 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -631,14 +631,14 @@ static int sunxi_mmc_probe(struct udevice *dev)
>  	cfg->f_min = 400000;
>  	cfg->f_max = 52000000;
>  
> -	priv->reg = (void *)dev_read_addr(dev);
> +	priv->reg = dev_read_addr_ptr(dev);
>  
>  	/* We don't have a sunxi clock driver so find the clock address here */
>  	ret = dev_read_phandle_with_args(dev, "clocks", "#clock-cells", 0,
>  					  1, &args);
>  	if (ret)
>  		return ret;
> -	ccu_reg = (u32 *)ofnode_get_addr(args.node);
> +	ccu_reg = (u32 *)(uintptr_t)ofnode_get_addr(args.node);
>  
>  	priv->mmc_no = ((uintptr_t)priv->reg - SUNXI_MMC0_BASE) / 0x1000;
>  	priv->mclkreg = (void *)ccu_reg + get_mclk_offset() + priv->mmc_no * 4;
> 

