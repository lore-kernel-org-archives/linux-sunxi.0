Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D74426ECF
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jul 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688930; cv=pass; b=shFZk22jTA/8eMtgx1jtTiDqcCmBOfiYvuCdZ+MTLA+7YRaSWZUgOoKbVCnbQfjehnig+Y4VNGNF6EgjXXnNofU6J6att/ydq5rCQ00SxRbqISDEh7WqUT1JU3UCxx+cIiIWTcwGOsUb9tHDP3jnoz/+4wnEwFWVkqygV77W2fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688930; c=relaxed/simple;
	bh=ps29wYiABii6l1raYJPu8jGO+QY9Y08lyWKo6XlwVyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+jlGX133Rb25zYXiRGxmt0IffrsT2qdA6OLfGmz6q/eYuusIdYu3WwIpsaygJc+MJLrNQI2uEcZi4awltum3zrlzsbDRg46g8WpPvqXYa+6IjgIIhg+pAf1XwOgnZZRLNrBWyYlOeo6BEQoeefcVeqaAXRoG4t+crJJeu3jh9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQbhMoe3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2rpq2LM; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQbhMoe3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2rpq2LM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6LSq873449
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jul 2026 13:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=; b=PQbhMoe3PoBcb3Hs
	/DihV9aYD7N2odD9vazHqRjsDv89h5rZHGphaH+tpWhsa7+af5rBKTPuJdW8LPZn
	Mk39Wieqo6Mw60r42dLUd2Gxgi7p8bxjZpLshjrj7AzbL34A0DXvPUZmVUH4NX0g
	MgtJWs+BKx0AJ2Ezx5aSRboaeoiSWTe52rVeK8zpfzJ0RAwKpEqAfSYiOKp5qRRf
	EsdJxs0bExnyDS3qhxtop/v2dbSfVm0i9jaV/APL5yQgCnzY8s/Y1+SDeOsMMPGn
	F/+wgSzwHMID5UrcvHdiCAnKRs1pvv9gBeLt9XKdfGXLhg0wmyfSh8mZwn6Udt4N
	ZKZX0A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8rg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jul 2026 13:08:47 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6675e8ebb1aso1215716d50.3
        for <linux-sunxi@lists.linux.dev>; Fri, 10 Jul 2026 06:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783688927; cv=none;
        d=google.com; s=arc-20260327;
        b=WsMjRkRUz9mQ9txz59HzWFOV2Awi/IgQt5Xa7SzMLsKqs1Usm+4Gc1BL+QWbA6zSL1
         /7RqyZ0OsWjARbDEEeBmZ2xQAol4P5BTOlGJAU5J4EbmQ8CAJe71GEQNB1bhNoXchaKM
         mp+ssil68qmBLo+EFeCU/t243FFgcwKyrFjebgA4UUjdZ7oxAgxBI56eG0tYqVWlxl6n
         euly3n2pa6GriFy7In2Y27K/8OHWy5L3UQyNIcNlRBGjSPLasQ6Ayd8Ke7ftwrAyev8C
         deiqvH7yzRLYPjmFyQw6qx3+TLKumXkQ6CIqHt6kYjv/MW4rAMoU8dpRZqus+w+XTrZ/
         yLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        fh=PoGao7J7phsg4cwhGe51r7Fq33JaaUr0qrfagYNSglU=;
        b=KoEF/VyNe3YfH7CuKfyCA7fo2maG10v1gW7YY3ZlNl8cn53kI3kCi/ERLzEqM9niIe
         2+/DTB0tlodKndauixOTB+TjZa4A3/8kzcYknJlfAExrMij7hWAeuQEauKnqst7UGJUG
         4sCR2LVNFKVt8HOXR4WdoIgpsGdvsqil5rjHDmkGOb+wQMWBEHrcZy3U477whhqV3jcX
         il4ct+VV7y6J3yxAKASWTsy7KtfpHvI34bC7tCz1gMQM5sXLB0nQGtL+I4KeNsf2QT9m
         cIVJLvkTP6TDRi1LCslfK9nMexwJiTDaxDOTcD6Hh5V438PUKDm6INtE9t5/UP6pGMSL
         xFTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688927; x=1784293727; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=O2rpq2LMX+eyHpg6+0uDYTLWxjuBcpUXW6luq1tqpwo0xHDJpluYEsivikOhvPy5B0
         gcxVOSGHR7EmCCX48VpzSvCwVwNN1fFNlt258400ODdaWKXWMXq3WnajMa45P01DbvmS
         oexu9pCeH8wqtV2AJ06luqPBsOFEoL2LhxmmNVSmmr8M4CSzfuHdkwJ5B8khvBRlBYBl
         lEof9TghcOSby2U2krgr+SXo5oqk3J07dFdXvRjdmgcOh7VpOLr40oOCNvnmcAfFrjN8
         0ZqX4EPOFpZcS8tqmlfEAbd4jZWbUgubi3ap2sq/A6JZhkadJ8AY1EhZUJEftAX/PFtQ
         0oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688927; x=1784293727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=fheoqeeaSsRBvuRXwuP9jszSOfP2JjKbIbA13qgiVPqAHzHeeaKU98IyzJmp+2A5q6
         GgVRy8rmjboZAXl6VrGTghgeuhhmj7MwpK77QMsxsm81UlLEuoO1UiXZEBy7DDGE0Xg+
         AeDm6YPTidY48N38IFrd0xFRVVuqLm9NshJVdC2wSOK+nqi9XeWW8exAo7tFJNbNx25+
         D2e0It71veOc6lai7+UsexyS0cJaZeR+k2I22yoW5jytbPOFJd7HSFSNPNEThEOJXIPv
         sI0b5Z8dhijA2lZcPr+qH398JPU/k33srbtYiNzBOScKcsCUyiuESVXWyffpSWnV+CaJ
         2BgA==
X-Forwarded-Encrypted: i=1; AHgh+RooO5vTd8zYElBNw67ckZXJxSnK/zx5sA0Zz2VaH6aXyc+Q44T97KD6Ca3KGVQTx6voe7opEGLXXwdluA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwA4ArsNudNIdj4WG7ViXD49q+BUJRGDwKNDs0KRrOpcLCjV90X
	5GpnnghS4zssKKRRPFVikbTU5+HwqKV7RLoSjUtpSADZf3gtDZrg0dX4WETdD2h7PU18vOSfBpY
	haBtODdDvexmiDtXvjkWNTvTo8nKkChS78LXVTfcp+I0gSMuvfSmeWBd4X0cZos7/Yp7KAOJP7D
	/0rnk9YfBU8ANJL5WoSBJTzDnHWeV/iyaytM5xIGwN
X-Gm-Gg: AfdE7ck7pY6eniRDQxFw/l6+0Su0QhFbDG/cX5uDnqkoJ24m9O2IbYQbq4HdV4fJCby
	S7gdzC2UgB3l2seRGcsP2C0X2zDQTeNJJjrCOHzylr6O6gn1VLh46EOacnNOJawEMWSbubS52vE
	iv9K6WsbAUp1ydjKkmUUvDW0Qpu1anNmRBkKtXSW0x6CYlF6FX+kB5mCgXysrdlTi1P7Wg
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id 956f58d0204a3-6679f245672mr5946001d50.92.1783688927273;
        Fri, 10 Jul 2026 06:08:47 -0700 (PDT)
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id
 956f58d0204a3-6679f245672mr5945969d50.92.1783688926691; Fri, 10 Jul 2026
 06:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com> <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:08:34 +0200
X-Gm-Features: AVVi8CefhojPUiWasaXCCjZmJBb6K9Qzlv92c3u5BPoEMYadIduP2fyzpl9La3Q
Message-ID: <CAPx+jO-hkYQoEOj1Jrp7sn5HXYTDbfAG4U5rpNBW2Wue2TZxhQ@mail.gmail.com>
Subject: Re: [PATCH 23/42] mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50eedf cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=z_eSG8vRrt57AjWXvbkA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: tWT5NL-DxJAYMW9NSTYuPgmninRCJ_qJ
X-Proofpoint-GUID: tWT5NL-DxJAYMW9NSTYuPgmninRCJ_qJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX2Re9uWNu/CAs
 Ysj67mavfW8s8Bw3MlyofUcT1xdKQp+B8yHvjt//dzzq4mm+wENaz7ek+7ajhpIs9V+B7LFX+LB
 wI5CDO1eKobZhRIg1q2fI5xYiJu0r18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX6r69RgcfpTs7
 me+SWS9fIBkhzXhzqf5hcf+cbwZnd3oLmPQlW6sIdyawDiUkdJYpHJR64hXL3cKt7wnL27jW46Z
 nmjClIo0mFlvYC4MdYFsz4efJ9tuYPuo7QX8xuH3+mZ8/DSSJSL/rn79gwUDhcVmZrIukRsrw62
 4AHjPHIWC0RJiZEBtdDRgx8lw4jixlRTpbiYhsQTvvnWz8PA/nT6ETYTKyZJ69EY9VV/3VGpThM
 2lYiThwjsAclmFaZLiff2A94xTQg5c9zgo4tmRu1JG9p5DX8118ehqiLs+Y+ECkiHJooc7QkLPm
 pnRkds0g4F9WIDNzxCchd9BaY511PsStKRPVlb1b1kyMEy/qo627dhiwbaA7cGKMKHT7N7sPq5f
 3HxCjCkZFiVBctw4ZvMp8HC509LYXhFvnDSQ6TTOVYOUGEZ52bhZQv5HpfQqT59X8VRn8oynBAu
 PN3Dk3KEMEGzyhRxDmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100130

On Fri, Jul 3, 2026 at 9:48=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init_by_idx() instead
> of the manual of_reserved_mem_device_init_by_idx()/
> of_reserved_mem_device_release() pair, letting the device resource
> manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-bst.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-=
bst.c
> index f8d3df715e1a..304554ced690 100644
> --- a/drivers/mmc/host/sdhci-of-bst.c
> +++ b/drivers/mmc/host/sdhci-of-bst.c
> @@ -405,7 +405,6 @@ static void sdhci_bst_free_bounce_buffer(struct sdhci=
_host *host)
>                                   host->bounce_buffer, host->bounce_addr)=
;
>                 host->bounce_buffer =3D NULL;
>         }
> -       of_reserved_mem_device_release(mmc_dev(host->mmc));
>  }
>
>  static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
> @@ -417,7 +416,7 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci=
_host *host)
>         /* Fixed SRAM bounce size to 32KB: verified config under 32-bit D=
MA addressing limit */
>         bounce_size =3D SZ_32K;
>
> -       ret =3D of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(=
mmc)->of_node, 0);
> +       ret =3D devm_of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc=
_dev(mmc)->of_node, 0);
>         if (ret) {
>                 dev_err(mmc_dev(mmc), "Failed to initialize reserved memo=
ry\n");
>                 return ret;
> @@ -425,10 +424,8 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhc=
i_host *host)
>
>         host->bounce_buffer =3D dma_alloc_coherent(mmc_dev(mmc), bounce_s=
ize,
>                                                  &host->bounce_addr, GFP_=
KERNEL);
> -       if (!host->bounce_buffer) {
> -               of_reserved_mem_device_release(mmc_dev(mmc));
> +       if (!host->bounce_buffer)
>                 return -ENOMEM;
> -       }
>
>         host->bounce_buffer_size =3D bounce_size;
>
> --
> 2.53.0
>
