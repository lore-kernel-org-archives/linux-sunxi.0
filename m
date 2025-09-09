Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E935206D
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429543; cv=none; b=VoAPQM2BmZnrFkWwJQ3IWiP7otH4CMTsWSVelLGnFSEhCqKzhOPBnCA2O4DXtvkZxXyeYye+fFFz77tbpHtPBqd9aywuGcxxBNgalWD7rSrhhV5IoLLYPOOaJeKy47HlXCAj3+aWuwrrqNQt6E7S7rL9NmekS4wlj5I4n2Sii6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429543; c=relaxed/simple;
	bh=HknzX0xAST5U5QLgNvfO11z5aVo3wOUQOzJF7QU1MaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INuuqg+V1bhQUSVHsjbKWqp40Uv4CFBvu6SzYrq1zBANOvVM9LZZhhqaP3XaCBnKYuauJuxi2cN4P734c2JJUO6//E/77Tz2bR4OzRzwktwajVIzn10Hd4nGF3ry1DLLKW9mMCWbPoBdhBWGp4yhnyCwLs00PUstFM9Zid/dmvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dE3M6rSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dE3M6rSJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LS4t032346
	for <linux-sunxi@lists.linux.dev>; Tue, 9 Sep 2025 14:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PE+T/FZyuTmpvyf7ua/nvmZNTNQAEt/0dfhmApWw+vg=; b=dE3M6rSJ5PgGEMhe
	RuFknfV1pMtgdva4C58/L5YBG0c/3x1O0gTcymygz9Jrj6ey0eX5G83og2CHnJA4
	zeqFReSVAgfm/ag1z76O9HZpIZgnLeoWsQ8cGKRRL8XnCDD2QZUPJ4Y8e2ekBcc4
	/4qdHhS39lfzHGuzirN4eUjrGBw8Yy/sceJw6boWKYFag0J4JwCzvQzXMpsOVrgf
	sNh36Gt6G3GjIBrqIaImqtkvdodoVnulx2qQdECLQmo40A/WFFVw7tByGfykIU0P
	ge0BzjmRriKxxYlX93ia/IEylKEnaLUv8Z2Fg0XxF5IEQGLAS0OQZPf2AQT3FSe8
	xiNMnQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0f5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 14:52:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7507804a7f7so36408506d6.0
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 07:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429537; x=1758034337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE+T/FZyuTmpvyf7ua/nvmZNTNQAEt/0dfhmApWw+vg=;
        b=fh9dgO1IB/oT/2BtgGt+5I5cVplNTAZwNi/qHQP0m6ccd4ENWkM/o/tuhHaSsvsmEd
         dEjd+jKvno/7gIadVyN5izsoOaTUqln1gAArFcMujUzZTcctJYyZ7eOklmwiVthUKEHy
         x/veu5wwFWlNKfd5KDJZEAaYRYl99gmaiX3JvXiSnZnOaXofn7MwLJAHPhTGw47foHo1
         Q+YMyHc8o+8N7OyIjVNI6oTvtspoqiaKYRYN7utNbJCKxoD9FlLPYtRS+P0LXjfgp1X6
         WNrS5K0lhWCH54rspLsZtAEONrsUIwEbjVHm1dR1+JPAZmWttXzdQ3ZYoexnqbJcWJWa
         cbFg==
X-Forwarded-Encrypted: i=1; AJvYcCXYqrlq5KIymSdXozaNPk4VgsY2CRtEboSwril4Hy26jerZNxvNLk99r8eWucoO/CCbYuG3DqG84X0Ssg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGAgIRsM1qrdQnQ+8Au4uuu7lauq9SlEOFT4zuR874m9r71f7o
	d2AalCRCdtmKVIg2vawkOUbm4cLnpSRCT8SbRcipI6j4zY7sf21lacgRVYHvY2XUoqfD5yiYPSv
	xT5FO1CkIDm0Y25W3POWJlSpWYSZLV6IvAZz3iWNNgVkt8aIi/PeZ956mqgvpn4wV/g==
X-Gm-Gg: ASbGncvDNe1K2EfsY0k50hnWfKhIKgT2dk/N9I8y4vZsvKfsLye+gGni58QAq+Nders
	r1qGceYgPYsYOrGJMgq3fEXpY+im+eJTPG7h7xgFuP8dwWXAv2YGfhjq1mkOlmDMV1KaypETy0q
	kBswwVI9JVRYS9AIf3Wm4U++PeAvE73Gzace9Wzb6pqPW+6PrRNTbp7lBt6/vhW/Pk8NGXOrI6W
	DjkrYkIR/KIN1TbLXcq4qRC9ffYUrNdBW/cv/6vHRS9KV6IgsvtTaqCx1opWuc0hEUKSa+1WRk8
	gIesDnd2NyyF851FzYNFU0pBPexV+xoVYm+rkOBRlP4ZZ9+D1/5HPsIpcrMHCVvhaIy3A5KfMA3
	FWMGZ6p+AjrMO2JF5KKnsfJNkdmJzLGiyJUxWWj2H8wFaObpex4FW
X-Received: by 2002:ad4:5de2:0:b0:722:2301:315 with SMTP id 6a1803df08f44-72bc4f93957mr184628106d6.29.1757429537145;
        Tue, 09 Sep 2025 07:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6VRM/IqVRJKXO81d0zT+XPixBAwFdKLiapVJ34MeMBozB2in+dHoYjUEUQ6Ok2p00fI7S1A==
X-Received: by 2002:ad4:5de2:0:b0:722:2301:315 with SMTP id 6a1803df08f44-72bc4f93957mr184627466d6.29.1757429536407;
        Tue, 09 Sep 2025 07:52:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:00 +0300
Subject: [PATCH v4 02/10] drm/bridge: adv7511: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-2-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HknzX0xAST5U5QLgNvfO11z5aVo3wOUQOzJF7QU1MaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8aH5xYcnrhsuEgstp3NDxwVu4bKX6MZD2EA
 4Yu1jcDcBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GgAKCRCLPIo+Aiko
 1TL+B/9MGL4mOR5FQjVfkhA/rQpcknnZoUMUAO2Gqv9h5Cz3u4e16jwPuv5boINoPhZebsK2s+y
 BrjiL1vqNJBOSO/UTkOjx/0fS8qhkk3L5Yv+bNbRqKEfdkUhtA25C8oq5pcAK3F8syC7y4p7S54
 /gF1zO66ME26uY668yT5CVicNHoQ+CGhnN51eeDSMSu69RotLmN7ZhVaUrnI+eeCkKs5zbqyZKN
 NIip2uT0ZPB0mWKx9MTQae77WC4y68wdJUpmh7jQklseJFf8M2MUTedWFV6PvWAs1vBjl3henPA
 rHDVrA+r1ygL8hZqca9H5UpXs3QjLHc65unr3Y/miZKmpJ0n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX9UMkQ4B1zG5G
 dBezNEy6KcLERzYyJClJMy8rzCQ35c1H2pDkjidZCoK7z0h/7QkgGg3CBd52azDWhOkVw8f8rA+
 DpCQ+V619e0QYsI2udnn4/RCShFtqwfdTixaSg6xZVnlCzFY0CvN18gxbAPRveG8xNU6qtQb05y
 hLMtOmfwLNvlfrYsWmS9RWD1VGYBBVVCoiPNBYzAhVPWyIotwfCS6Dz81c1F84dPFW0KG9OfkTP
 dVVmTw3ik2EXQAyUdoV5n+I7VYVwmDb2okmBjXCeO7Wz1mjNP4menOfsUTPbsu2jLk3BBk2QZSS
 WG/nyqdLtkp6KXTYPYigeiP/wE5WsidsVS5bB+VZWBOyroinkMSmdcy8eE3b78Eig11qEBey2Kd
 V0P9CinI
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c03f25 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=2sjEEKaKrRP40jhUrFQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Uhr-7exgKW9NnXKJKZuo1PNROTImxcZy
X-Proofpoint-ORIG-GUID: Uhr-7exgKW9NnXKJKZuo1PNROTImxcZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..280a5f82ebb0c792a0667e9f55af103f29ff2948 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -907,7 +907,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -967,7 +967,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -1328,6 +1328,11 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.3

