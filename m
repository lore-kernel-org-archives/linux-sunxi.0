Received: from mr85p00im-ztdg06011901.me.com (mr85p00im-ztdg06011901.me.com [17.58.23.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DEE3237
	for <linux-sunxi@lists.linux.dev>; Wed,  4 May 2022 19:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1651692800;
	bh=4ht9G50SlYlr7BPTCuy+KjNotHQlLEXbSKghIYlF3TI=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To;
	b=mpWDTIXkVWICEbwP8lVucvUj2lXp7sgQANZDAy4SypLlwTlIvHxoCNneQvRa9H0IH
	 P7CY4MUJAtz/6KtrWpuwZU9f3KjM/u9IyxXM3f0nfSGim5MeZUAkNis7cMl8zFlhiB
	 7KSTjOif87OwMkrGMJrcDASZpBD4LuyGM3tESxFxmKlQLEWFu6bOEKNBqKrieYEGgV
	 U3hgPrhIwmv0bDeSoAhFSGLAPxm+5udruXrCFszANHgcQmeiKCB/MmpazN02tYXSEf
	 ylAuXE7qPZaViZ/n7p3FxWRwg+9vPSZxZNEWca9tsFjTf+xm+CF7YiNUgWrbfCX/1W
	 9Y4C1tekqmAiA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id C2A01900AD7;
	Wed,  4 May 2022 19:33:19 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Jamie Cuthbert <jamiecuthbert92@icloud.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] hwmon: (sun4i-lradc) Add driver for LRADC found on Allwinner A13/A20 SoC
Date: Wed, 4 May 2022 20:33:17 +0100
Message-Id: <AC0C5D3A-9080-48D1-9478-340DB024F21A@icloud.com>
Cc: jdelvare@suse.com, jernej.skrabec@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux@roeck-us.net, samuel@sholland.org, wens@csie.org
To: rz@fabmicro.ru
X-Mailer: iPhone Mail (19E258)
X-Proofpoint-GUID: FQSkHrM5o5Ppy-zYGYBiJEvmRkzaD34A
X-Proofpoint-ORIG-GUID: FQSkHrM5o5Ppy-zYGYBiJEvmRkzaD34A
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=382
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040114



Sent from my iPhone
