Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC5A3451A9
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787073; cv=none; b=LOKEt3QUtG/1RvxwgA0/LJS9irD7qVrTB3RXmPZzFE8BeD+qBru0sddJ4VX7sJjPsyPAtYak2Rer/qcWnA5uks5IpzmGp4Dx4PuT3jlTmEp2QjE9yVqLsdWbOZV9dlINlLdyQMQzi7/U+o8cJI3z2g36R1wJs1dWt2QbW855j6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787073; c=relaxed/simple;
	bh=0zVDLT5mWwh1rk+2l66Ze/WnmT4BZ5B/kJxiLwHBLIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLmLn/m7vkRiBNz+a56EfoxER3nSiWBt6BwouIfLcSSp+JxDPGfbTHxwosW9YH/1XYi5maEKHc5cRZ8L2jc+AY8iPEReVgYdnSZrA42l/zRUDTTX38VAcqenbr1jVAZz4eVgfLPBXGfxqeHy+83p7Xa1Bpk+YoXuFWWpPwDJQ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDFHNou7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IwLinNN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDFHNou7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IwLinNN1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCn9Zb3257259
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=; b=lDFHNou77qSltRFT
	d6mQBV2twhNcfaV3BWEzHvLwNzBM7Kr1tQOtNZtfUAUFioKt1G+wO9ITN72NKDFS
	5UDnm+2ORgJBRVYctxjUSqeXte0QTQI0whKUztK20/S9eDDxSBIKlNzGfG/fTzzZ
	krNDDSq6SqgYvLRhpQAm/le6Ped08gdfIz5V4pBftRdXaXoxVN/KLS6noPl6QxFV
	gnRDH1GOZwh0PUZDpyL5fTxXld3145ylLiprYYjdW/HcbSeUAo6FqsnTbISkgNcV
	Flq5TIjocw4Vyyk0U0euYYEWg4ecfkIQo8O4rKkrzjjubft0Qqaq60D2ufG9NAxB
	IUFJfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3naa2n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:57:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so117870981cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787070; x=1777391870; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=;
        b=IwLinNN10GT8f3K3tHLRXApdrQuDXkhabrJJip9ZvQtm/dH1rw4aa8wP+hT3gPl7B6
         7cOG9JfNffqCY0aIC7ZeE3vW7ruIZJHdv9EuHLSywREJeqGHT7c78DlyvqQfNJ6GlITB
         JCzr4Ef69dW+MFNnq7C28QsnKI+nYo+txH6oupYCk79xMsx5GTWAzFTXIavxqneN0wms
         mq5Tn2+rRaTTaDzOlA5E5sVNdfwX52SZu4w5pjKisvS7PtZ5iHsMk1N1ISp/d07rqoQT
         w63zMMQb283XKvp/1JNuju9hGye24QbdXRTirnbDQa+2XQd5F8dkyeQbtIm2vHiS9bTx
         PiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787070; x=1777391870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=;
        b=p03bFAjnW/xd/BflIUo3cnHqRmFixrrIQ48rR1JDZTBwaohGZfds+LjzKLRm0cdun2
         IEkRDxZ++QrU8HNj3OO4n6rYxcAxdhrpt8dIYXlcigU78WBSDZSimAVdgRlWuY5FmuVH
         k9Inw39vIaG6TabRYJrhzmaNMRr6LvMbovXtvMxSgo9HYGaS3rL69Jrbkb8EJDpAaEXk
         HXEcO9KMWWoFjn0yEnvY0QL0xWj3JfVVvhQ8Sln3l+ujyqFxWCWpL4wfP8kmqbT5rBcu
         F42rpLHN7z91hyw9avoYEljGaCxpiHdOP+etxenRNzou+RW/pChACHOyWvWWV9uxzCC6
         p9VA==
X-Forwarded-Encrypted: i=1; AFNElJ+B1P6cQ7Bzwchb0Jzwia5wuS0916bGJMCFeywbxS/4kYYAZmUkeQIeHFCCUNZFg+1F/kZ+pDEKHi3rHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSfQ4GjNeqaptPYEpXhNIPDvTeRuoUubsidlWGhYHn98vgNVsZ
	i5HQnv+uSCeLifYvQ3rsEleaz7/u1ZDKHL2srGuGhnF2qjxpOn6Z7nX0dpjItcMdQukhG0HpkiR
	cWM8zY2nFFvUh8GAv4PnfMNmjkPkXICuB/foQGf3sqhEp3S8YZMWkhZabZYQnpkALog==
X-Gm-Gg: AeBDietZ2FNzBpfwGNzwJUIkTHEC41KtelVSKhAo+TVOPQ1dXEWNmiGDwjScvfAq9Nj
	f6lF83Cz8HZnxsgSYDefMJs7ai7gTsR3K/KFR6y1dMyWubhnOgvw4iimxLMmj3pyZr13DpypHhs
	rOa6KAx1Ko8EBIJA24Sv2vGPjHu45E4fvpbvsvC5jcYRrPElceYUJBc9KANX9w1hRXlCGDyID30
	dtrmGK7+3JjbXWOBi9E8LVJLP691x5Ehz+GK8qmGy3oV3GV7w35QTed65LwVQvMFm/bR9UqOzNt
	79n7GsjRoFJr7JPkrtYzMEWOOc/Y3UbK/gE03eq6F+6opVTCi/VM5zcXe/ZHkz5NYMgo7wp4sPw
	VrAzV94pQeQ69pRGLrnR0czeClUN7Tuyf0G50gGZbgU8yGuPj9RjSEWEyGMWuNYU+gOkFBDHv4l
	JmqLRSCsLHopBjUnUbSv20HptLDkNIc0HJGO0EMKNo6bRorA==
X-Received: by 2002:ac8:7f0b:0:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50e36ca52aemr279020541cf.59.1776787069997;
        Tue, 21 Apr 2026 08:57:49 -0700 (PDT)
X-Received: by 2002:ac8:7f0b:0:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50e36ca52aemr279019841cf.59.1776787069503;
        Tue, 21 Apr 2026 08:57:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a5241f6583sm1444371e87.39.2026.04.21.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:57:48 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:57:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Alex Hung <alex.hung@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
Message-ID: <rkrhykm7dcttupn3plthf2m5sshtnnojib3f4pj4lxwrswetai@ncxm7oos35zz>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-15-c63f1134e76c@kernel.org>
 <79cc30d5-80b5-4d87-a3ad-36d6fad98853@suse.de>
 <dd39f423-1598-4749-8c95-98b8daf69680@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd39f423-1598-4749-8c95-98b8daf69680@suse.de>
X-Proofpoint-GUID: 58slW5lz3yJatPnAlP77zUx6rEQavgA3
X-Proofpoint-ORIG-GUID: 58slW5lz3yJatPnAlP77zUx6rEQavgA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX2aLsNLlyk603
 YZYRcuN30Ee3fMSolqrFAsYTOwpIA6XsqqruoW9IvdnNfk4rMjrnMlBQ+KvXYCxFiCLRLy5UErQ
 43u73wL9oOON6ryAlr2FW/ePv5rMLV55Xc306mIQY7ZsS/dSkBl08Evu9QdCBfdlN5Rq46Cvm69
 rFRuIxeyJasZhKqkbhfivDqkdzjqDTa58oc9UjC7Ots7NXhDUataoVWfS1oJNUtHLX23Q+gv37X
 /ou8FxyZXsrDg+MwxtE0YbfkZUa7HlY2PaKPa1UiAGZ9uU8KN51sMz7TYQyNXw+ZoXaQd5AtjMH
 kK8h5LGaz78/dkqCICHGEeIXCq2GGsvXWCvo3R31bHtfaLsQ7orXr7UpJHnFqlJjYQh05vp/Bff
 fsPcJgAjf3NOvEe3nWBgvrtDvlgxizqlZ15hdBs30HjdsrAt5fr4u9CeVINLBdfbS2FyDOgZuhg
 1ewgUixEhh97O64jR7Q==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e79e7e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=YNIvkKx5IWywne6YJjgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Tue, Apr 21, 2026 at 05:33:12PM +0200, Thomas Zimmermann wrote:
> 
> 
> Am 21.04.26 um 15:38 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > > Almost all drivers, and our documented skeleton, call
> > > drm_mode_config_reset() prior to calling drm_dev_register() to
> > > initialize its DRM object states.
> > > 
> > > Now that we have drm_mode_config_create_state() to create that initial
> > > state if it doesn't exist, we can call it directly in
> > > drm_dev_register(). That way, we know that the initial atomic state will
> > > always be allocated without any boilerplate.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >   drivers/gpu/drm/drm_drv.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d98662b5ddbcae8ded
> > > 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev,
> > > unsigned long flags)
> > >         if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> > >           ret = drm_modeset_register_all(dev);
> > >           if (ret)
> > >               goto err_unload;
> > > +
> > > +        ret = drm_mode_config_create_state(dev);
> > > +        if (ret)
> > > +            goto err_unload;
> > 
> > Way too late. Lets rather go through drivers and call this where they
> > currently call drm_mode_config_reset() for initialization. This can be a
> > single-patch mass conversion IMHO.
> 
> On a second thought, can't we modify the suspend code and leave the reset
> as-is for now?  I'd still be interested to use reset as a means of
> initializing the hardware or loading state on probe. So keeping the _reset()
> calls in place might be helpful for that.

But isn't it the expected behaviour? The driver can reset(), but if
it didn't, the default would be to create empty working state. In the
end, the drivers also can call this function to create the state, don't
they (and then perform the readout logic)?

> 
> What's the long-term plan here?
> 
> Best regards
> Thomas
> 
> > 
> > Best regards
> > Thomas
> > 
> > >       }
> > >       drm_panic_register(dev);
> > >       drm_client_sysrq_register(dev);
> > >         DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
> > > 
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
> 
> 

-- 
With best wishes
Dmitry
