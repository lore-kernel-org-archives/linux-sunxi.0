Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1057C
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Apr 2022 21:01:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 855F85C0053;
	Sat, 23 Apr 2022 17:01:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 23 Apr 2022 17:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1650747663; x=
	1650834063; bh=Pfu1T1qRk/vZ/W2spTi0VKVXICfJ7Ix322dpr2BI1KI=; b=q
	eKPqnMnsbJAiESnM4cojRYuD1ivgxmedmnzq0qe7Y57lUfq9h7oVCId4LTMOocq4
	3a0kElex09cXd3dq+rPP0tWsafZ1t7Ls26rcTKDSAd4c7GXvuvId3AeR/ZJ/VXGp
	Xd2UmHC3nmcv+iUdAZusgvzB8KJ6+aoQ56birv4Q4rAanFhhsJqzB5hSNGEW0utn
	bBKfQh7N/R/tqIDSNN+WfXaMBu7DZEQTYK8HTm353zDs+PoCQneFZqScx09TyJIo
	359kzv85+LxiFnI8zdLyPZ+ZP7cOYX0tUgimlShFYJw0puPk5WT4Zf34PRFSleUn
	ZCHbdVKRvVjp0P348F3Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1650747663; x=1650834063; bh=Pfu1T1qRk/vZ/
	W2spTi0VKVXICfJ7Ix322dpr2BI1KI=; b=W7kdZEMYq0g3kpk/SrKVwNjp5xDRi
	5T3N5Xxk9Zltk1s+INkiK05nKXtCppmucmau0L9CvWmYL/SvvHUFEFfTCUbILu16
	dOvxC7Ez6EOpC8Cz6SF1XNl8Q1PwMU/n9GXQSejdws++aVPuk6cgF8jRXx/xD41B
	9ztSRJgC082wf+MCUI6vYxjeZrhBhAauKBx12umcPaqxEGpC1dYPQbh2c/bjXtQA
	aiFORkIAjJh3MFubzxC5dOmFskh1EriYOtPI8EMuXKTQYX0MPtHduZgW8cV1YlCt
	tj3HuZumlXsyNm3v1h0TlF8OjuIMd8j8ldb2KJ/fSPQM8c2V4OpnCE4XQ==
X-ME-Sender: <xms:DmlkYs--aQ6HnvuHwo_aVkq7nYdM39Uv8VRzNNLZtRTZHbd4MiKKtw>
    <xme:DmlkYktUPtXCURf74m8M2Isvcx6zP3iCUR50CAgoKBLSZ29KvRebV8x5PugYrKitL
    47DXKeuhwu5UenaQw>
X-ME-Received: <xmr:DmlkYiCeyYEDa5Se-Dxm7PpmFEzLqGOIs9n-nMM5_cPaYDX4BjcDr_MalHulsqQEHfy6OLA5ima3XQ4xQmhbrMcq9JyPY1SdHZzz_m7j2XPOU-WDoDj-u02hZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdeigdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:DmlkYsd_TDGDE1O-npS7W0_damYsFdfQFVVmtrTPknCIEp57M_QMDQ>
    <xmx:DmlkYhP2FlJfGiG1r6um0umSSaFPTIUuxZsOQcKNpxnM04EsOeE4cg>
    <xmx:DmlkYml0RmmTYISE8x1666YxzawsOC2RDS0F4viasvqvCj5uoV4idA>
    <xmx:D2lkYmqzExc42jIk5Od-qQj5qeQlC4Mjxg254cjLpXmmkt1fWErm3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Apr 2022 17:01:01 -0400 (EDT)
Subject: Re: [PATCH] sunxi: fix initial environment loading without MMC
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
References: <20220421003448.4517-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <bed703d6-1820-8df4-747a-6114877dedee@sholland.org>
Date: Sat, 23 Apr 2022 16:01:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220421003448.4517-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Andre,

On 4/20/22 7:34 PM, Andre Przywara wrote:
> Commit e42dad4168fe ("sunxi: use boot source for determining environment
> location") changed our implementation of env_get_location() and enabled
> it for every board, even those without MMC support (like the C.H.I.P.
> boards). However the default fallback location of ENVL_FAT does not cope
> very well without MMC support compiled in, so the board hangs when trying
> to initially load the environment.
> 
> Change the default fallback location to be ENVL_FAT only when the FAT
> environment support is enabled, and use ENVL_NOWHERE and ENVL_UBI as
> alternative fallbacks, when those sources are enabled.
> 
> This fixes U-Boot loading on the C.H.I.P. boards.
> 
> Fixes: e42dad4168fe ("sunxi: use boot source for determining environment location")
> Reported-by: Chris Morgan <macroalpha82@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  board/sunxi/board.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 89324159d55..befb6076ca6 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -132,7 +132,14 @@ void i2c_init_board(void)
>   */
>  enum env_location env_get_location(enum env_operation op, int prio)
>  {
> -	enum env_location boot_loc = ENVL_FAT;
> +	enum env_location boot_loc;
> +
> +	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
> +		boot_loc = ENVL_NOWHERE;
> +	else if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
> +		boot_loc = ENVL_FAT;
> +	else if (IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
> +		boot_loc = ENVL_UBI;

This could leave boot_loc uninitialized. And there is still an unconditional use
of ENVL_FAT in the BOOT_DEVICE_MMCx case.

>  	gd->env_load_prio = prio;

I don't think the hook is supposed to change this variable.

I'm still a bit confused on the fallback logic you have in place. Splitting it
up into three blocks doesn't help. If the goal is to load the environment from
the boot device, while preferring filesystems over raw block devices, I propose
the following:

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 427113534b..27508bd306 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -129,26 +129,38 @@
  * Try to use the environment from the boot source first.
  * For MMC, this means a FAT partition on the boot device (SD or eMMC).
  * If the raw MMC environment is also enabled, this is tried next.
- * SPI flash falls back to FAT (on SD card).
  */
 enum env_location env_get_location(enum env_operation op, int prio)
 {
-	enum env_location boot_loc = ENVL_FAT;
+	if (prio > 1)
+		return ENVL_UNKNOWN;

-	gd->env_load_prio = prio;
+	if (IS_ENABLED(CONFIG_ENV_IS_NOWHERE))
+		return ENVL_NOWHERE;

 	switch (sunxi_get_boot_device()) {
 	case BOOT_DEVICE_MMC1:
 	case BOOT_DEVICE_MMC2:
-		boot_loc = ENVL_FAT;
+		if (prio == 0) {
+			if (IS_ENABLED(CONFIG_ENV_IS_IN_EXT4))
+				return ENVL_EXT4;
+			if (IS_ENABLED(CONFIG_ENV_IS_IN_FAT))
+				return ENVL_FAT;
+		}
+		if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
+			return ENVL_MMC;
 		break;
 	case BOOT_DEVICE_NAND:
+		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
+			return ENVL_UBI;
 		if (IS_ENABLED(CONFIG_ENV_IS_IN_NAND))
-			boot_loc = ENVL_NAND;
+			return ENVL_NAND;
 		break;
 	case BOOT_DEVICE_SPI:
+		if (prio == 0 && IS_ENABLED(CONFIG_ENV_IS_IN_UBI))
+			return ENVL_UBI;
 		if (IS_ENABLED(CONFIG_ENV_IS_IN_SPI_FLASH))
-			boot_loc = ENVL_SPI_FLASH;
+			return ENVL_SPI_FLASH;
 		break;
 	case BOOT_DEVICE_BOARD:
 		break;
@@ -156,23 +168,6 @@
 		break;
 	}

-	/* Always try to access the environment on the boot device first. */
-	if (prio == 0)
-		return boot_loc;
-
-	if (prio == 1) {
-		switch (boot_loc) {
-		case ENVL_SPI_FLASH:
-			return ENVL_FAT;
-		case ENVL_FAT:
-			if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
-				return ENVL_MMC;
-			break;
-		default:
-			break;
-		}
-	}
-
 	return ENVL_UNKNOWN;
 }


Regards,
Samuel
